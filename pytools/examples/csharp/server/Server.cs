using System;
using System.Text;
using System.Collections.Generic;

using System.Net;
using System.Net.Sockets;
using System.Threading;


class Server
{
	private static 	string 	ip	= "127.0.0.1";
	private static 	int 	port = 8888;


	static void Main(string[] args)
	{
		IPAddress ipAddr 	= IPAddress.Parse(ip);
		Socket serverSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
		serverSocket.Bind(new IPEndPoint(ipAddr, port));
		serverSocket.Listen(1024);

		Console.WriteLine("启动监听{0}成功", serverSocket.LocalEndPoint.ToString());

		while (true)
		{
			Socket clientSocket = serverSocket.Accept();
			Console.WriteLine("新客户端 {0}", clientSocket.RemoteEndPoint.ToString());

			Thread clientThread = new Thread(HandleClient);
			clientThread.Start(clientSocket);
		}
	}


	private static void HandleClient(object obSocket)
	{
		Socket clientSocket = (Socket)obSocket;

		ushort 	lenHeader 		= 2;
    	uint 	lenMaxBuff 		= 51200;
    	ushort 	lenTmpBuff 		= 512;

		byte[] buffers 			= new byte[lenMaxBuff];
		byte[] buffersTmp		= new byte[lenTmpBuff];
        int buffersLen			= 0;

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

                byte[] buffPid 	= new byte[2];
                byte[] buff 	= new byte[packageCount];

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
			case 40040:
				// ReqTestXX reqTestXX = new ReqTestXX(packet);
				ReqTestXX reqTestXX = P2P.PacketToProtocol(packetid, packet) as ReqTestXX;

				Console.WriteLine("{0} {1} {2} {3} {4}", reqTestXX.id_u8, reqTestXX.id_u16, reqTestXX.id_u32, reqTestXX.repeat_id_u8, reqTestXX.optional_id_u8);

				AckTestXX ackTestXX = new AckTestXX();
				ackTestXX.id_u8 		= 111;
				ackTestXX.id_u16 		= 11111;
				ackTestXX.id_u32 		= 1111111;
				ackTestXX.optional_id_u8= 222;
				ackTestXX.repeat_id_u8	=new List<byte>();

				clientSocket.Send(ackTestXX.Encode().GetBufferBytes());

				break;
		}
	}

}
