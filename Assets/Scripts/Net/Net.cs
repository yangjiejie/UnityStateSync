using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.Threading;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.IO;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters;


public class Net : MonoBehaviour
{
    #region 初始化
    private static Net mInst = null;
    public static Net Inst
    {
        get { return mInst; }
    }

    public delegate void EventHandler(ushort packetId, System.Object obj);

    private Dictionary<ushort, EventHandler> _msg_eventhandler_map = null;

    private string _ip = "";
    private int _port = 0;
    private Socket _socket = null;

    public NetSend _net_send = null;
    public NetReceive _net_receive = null;

    public Queue<Packet> _send_queue;
    public Queue<Packet> _receive_queue;


    void Awake()
    {
        mInst = this;

        EventMgr.Inst.AttachEvent(EventDef.NetReconnect, HandleEvent);
        EventMgr.Inst.AttachEvent(EventDef.NetRecvOrSendDisconnect, HandleEvent);

        this._msg_eventhandler_map = new Dictionary<ushort, EventHandler>();
        this._send_queue = new Queue<Packet>();
        this._receive_queue = new Queue<Packet>();
    }

    void Update()
    {
        ProcessReceive();
    }

    void OnApplicationQuit()
    {
        Closed();
    }
    #endregion


    #region 网络协议处理器
    public void AddEventHandler(ushort packetid, EventHandler eventHandler)
    {
        if (!this._msg_eventhandler_map.ContainsKey(packetid))
        {
            this._msg_eventhandler_map.Add(packetid, eventHandler);
        }
        else
        {
            this._msg_eventhandler_map[packetid] += eventHandler;
        }
    }

    public void DelEventHandler(ushort packetid, EventHandler eventHandler)
    {
        if (this._msg_eventhandler_map.ContainsKey(packetid))
        {
            this._msg_eventhandler_map[packetid] -= eventHandler;
        }
    }

    private void DispatchEvent(Packet packet)
    {
        ushort packetid = packet.ReadPacketid();
        Log.Debug("Net Received server protocol id: " + packetid);

        if (this._msg_eventhandler_map.ContainsKey(packetid))
        {
            EventHandler eventHandler = this._msg_eventhandler_map[packetid];
            if (eventHandler != null)
            {
                eventHandler(packetid, P2P.PacketToProtocol(packetid, packet));
            }
        }
    }
    #endregion


    #region 网络连接
    public void Connect(string strIp, int intPort)
    {
        if (this._socket != null) { return; }

        this._ip     = strIp;
        this._port = intPort;

        Socket socket = null;
        if (IsIPV6())
        {
            socket = new Socket(AddressFamily.InterNetworkV6, SocketType.Stream, ProtocolType.Tcp);
        }
        else
        {
            socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        }
        socket.BeginConnect(this._ip, this._port, new AsyncCallback(ConnectCallback), socket);
    }

    private bool IsIPV6()
    {
        IPAddress[] address = Dns.GetHostAddresses(this._ip);
        return address[0].AddressFamily == AddressFamily.InterNetworkV6;
    }

    private void ConnectCallback(IAsyncResult asyncConnect)
    {
        try
        {
            this._socket = (Socket)asyncConnect.AsyncState;

            this._net_send = new NetSend(this._socket, this._send_queue);
            this._net_receive = new NetReceive(this._socket, this._receive_queue);

            this._socket.EndConnect(asyncConnect);

            EventMgr.Inst.SendEvent(EventDef.NetConnectSuccess);
        }
        catch (Exception e)
        {
            EventMgr.Inst.SendEvent(EventDef.NetConnectFaild);
            Debug.LogError("socket connect faild error: " + e);
        }
    }
    #endregion


    #region 网络发送接收数据
    public void Send(Packet packet)
    {
        lock (this._send_queue)
        {
            this._send_queue.Enqueue(packet);
        }
    }

    private void ProcessReceive()
    {
        lock (this._receive_queue)
        {
            while (this._receive_queue.Count > 0)
            {
                Packet packet = this._receive_queue.Dequeue();
                this.DispatchEvent(packet);
            }
        }
    }
    #endregion


    #region 关闭网络
    private void Closed()
    {
        lock (this._send_queue) { this._send_queue.Clear(); }
        lock (this._receive_queue) { this._receive_queue.Clear(); }

        if (this._socket != null && this._socket.Connected)
        {
            this._socket.Shutdown(SocketShutdown.Both);
            this._socket.Close();
        }
        this._socket = null;

        if (this._net_send != null)
        {
            this._net_send.AppQuit();
            this._net_send = null;
        }
        if (this._net_receive != null)
        {
            this._net_receive.AppQuit();
            this._net_receive = null;
        }
    }
    #endregion


    #region 事件监听
    public void HandleEvent(EventDef id, object data)
    {
        Log.Error("Net HandleEvent id: " + id);
        switch (id)
        {
            case EventDef.NetRecvOrSendDisconnect:
                if ((Socket)data != this._socket)
                {
                    return;
                }
                Closed();
                EventMgr.Inst.SendEvent(EventDef.NetDisconnect);
                break;
            case EventDef.NetReconnect:
                if (this._socket == null)
                {
                    this.Connect(this._ip, this._port);
                }
                break;
        }
    }
    #endregion
}
