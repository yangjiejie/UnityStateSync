using System;
using System.Text;
using System.Collections.Generic;

using System.Net;
using System.Net.Sockets;
using System.Threading;


class Client
{
	static void Main(string[] args)
	{
		IPAddress ip = IPAddress.Parse("127.0.0.1");
		Socket clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
		
		clientSocket.Connect(new IPEndPoint(ip, 8888));
		Console.WriteLine("连接服务器成功");


		ReqTestXX reqTestXX = new ReqTestXX();
		reqTestXX.id_u8 = 111;
		reqTestXX.id_u16 = 11111;
		reqTestXX.id_u32 = 1111111;
		reqTestXX.optional_id_u8 = 222;
		reqTestXX.repeat_id_u8=new List<byte>();

		Console.WriteLine("reqTestXX.id_u8 : {0}", reqTestXX.id_u8);

		Packet xx = reqTestXX.Encode();
		Console.WriteLine("reqTestXX.id_u16 : {0}", reqTestXX.id_u16);
		byte[] oo = xx.GetBufferBytes();

		clientSocket.Send(oo);


		ushort  lenHeader       = 2;
        uint    lenMaxBuff      = 51200;
        ushort  lenTmpBuff      = 512;

        byte[] buffers          = new byte[lenMaxBuff];
        byte[] buffersTmp       = new byte[lenTmpBuff];
        int buffersLen          = 0;

        while (true)
        {
            int readCount = clientSocket.Receive(buffersTmp, lenTmpBuff, 0);

            if (readCount == 0)
            {
                break;
            }

            Array.Copy(buffersTmp, 0, buffers, buffersLen, readCount);
            buffersLen += readCount;

            if (buffersLen <= lenHeader)
            {
                continue;
            } 

            while (true)
            {
                ushort packageCount = PacketUtil.ReadUshort(buffers);

                if (buffersLen < packageCount + lenHeader)
                {
                    break;
                }

                buffersLen -= packageCount + lenHeader;

                byte[] buffPid  = new byte[2];
                byte[] buff     = new byte[packageCount];

                Array.Copy(buffers, 2, buffPid, 0, 2);
                Array.Copy(buffers, 4, buff, 0, packageCount - 2);
                Array.Copy(buffers, packageCount + 2, buffers, 0, buffersLen);

                ushort packetId = PacketUtil.ReadUshort(buffPid);

                Packet packet = new Packet(buff);

                DoMsg(clientSocket, packetId, packet);
            }
        }

        clientSocket.Shutdown(SocketShutdown.Both);
		clientSocket.Close();
	}


	private static void DoMsg(Socket clientSocket, ushort packetid, Packet packet)
	{
		Console.WriteLine("packetid: {0}", packetid);

		switch (packetid)
		{
			case 40050:
				AckTestXX ackTestXX = new AckTestXX(packet);

				Console.WriteLine("{0} {1} {2} {3} {4}", ackTestXX.id_u8, ackTestXX.id_u16, ackTestXX.id_u32, ackTestXX.repeat_id_u8, ackTestXX.optional_id_u8);

				break;
		}
	}

}
