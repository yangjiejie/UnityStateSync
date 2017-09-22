using UnityEngine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Collections;
using System.Net;
using System.Net.Sockets;


public class NetReceive
{
    private Thread _thread = null;
    private Socket _socket = null;
    private Queue<Packet> _queue;

    private ushort _len_header = 2;
    private int _max_buff_len = 102400;
    private ushort _temp_buff_len = 1024;


    public NetReceive(Socket socket, Queue<Packet> queue)
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
        byte[] read_buffer = new byte[this._max_buff_len];
        int read_buffer_len = 0;

        while (true)
        {
            if (this._socket != null)
            {
                byte[] temp = new byte[this._temp_buff_len];
                int readCount = this._socket.Receive(temp, this._temp_buff_len, 0);
                if (readCount == 0)
                {
                    Log.Error("NetReceive readCount is 0");
                    this.OnDisconnect();
                    continue;
                }

                Array.Copy(temp, 0, read_buffer, read_buffer_len, readCount);
                read_buffer_len += readCount;

                if (read_buffer_len <= this._len_header)
                {
                    continue;
                }

                while (true)
                {
                    ushort package_count = PacketUtil.ReadUshort(read_buffer);

                    if (read_buffer_len < package_count + this._len_header)
                    {
                        break;
                    }

                    read_buffer_len -= package_count + this._len_header;

                    byte[] buf = new byte[package_count];

                    Array.Copy(read_buffer, this._len_header, buf, 0, package_count);

                    Array.Copy(read_buffer, package_count + this._len_header, read_buffer, 0, read_buffer_len);


                    Packet packet = new Packet(buf);

                    lock (this._queue)
                    {
                        this._queue.Enqueue(packet);
                    }
                }
            }
            Thread.Sleep(100);
        }
    }

    private void OnDisconnect()
    {
        EventMgr.Inst.SendEvent(EventDef.NetRecvOrSendDisconnect, this._socket);
        this._socket = null;
    }
}
