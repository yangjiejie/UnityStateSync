using UnityEngine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Collections;
using System.Net;
using System.Net.Sockets;


public class NetSend
{
    private Thread _thread = null;
    private Socket _socket = null;
    private Queue<Packet> _queue;


    public NetSend(Socket socket, Queue<Packet> queue)
    {
   	   	this._socket = socket;
		this._queue = queue;
		
	    this._thread = new Thread(new ThreadStart(this.run));
		this._thread.IsBackground = true;
	    this._thread.Start();
	}


    public void AppQuit()
    {
        this._socket = null;
        if (this._thread != null)
        {
            this._thread.Abort();
            this._thread = null;
        }
    }


    private void run()
    {
        while (true)
        {
            if (this._socket != null)
            {
                lock (this._queue)
                {
                    if (this._queue.Count > 0)
                    {
                        foreach (Packet packet in this._queue)
                        {
                            this.SendMessage(packet);
                        }
                        this._queue.Clear();
                    }
                }
            }
            Thread.Sleep(100);
        }
    }


    private void SendMessage(Packet pk)
    {
        if (!this._socket.Connected)
        {
            Log.Error("NetSend socket not Connected");
            this.OnDisconnect();
            return;
        }
        try
        {
            byte[] bytes = pk.GetBufferBytes();
            IAsyncResult asyncSend = this._socket.BeginSend(bytes, 0, bytes.Length, SocketFlags.None, new AsyncCallback(SendCallback), this._socket);
            bool success = asyncSend.AsyncWaitHandle.WaitOne(5000, true);
            if (!success)
            {
                Log.Error("NetSend asyncSend not success");
                this.OnDisconnect();
            }
        }
        catch (Exception e)
        {
            Log.Error("NetSend socket send message exception error: " + e);
            this.OnDisconnect();
        }
    }

    private void SendCallback(IAsyncResult asyncSend)
    {
        //Debug.Log("SendCallback socket send success!!!");
    }

    private void OnDisconnect()
    {
        EventMgr.Inst.SendEvent(EventDef.NetRecvOrSendDisconnect, this._socket);
        this._socket = null;
    }
}
