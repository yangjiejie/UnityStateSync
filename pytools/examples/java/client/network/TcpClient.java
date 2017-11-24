package network;


import protocol.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.util.List;
import java.util.ArrayList;

import java.net.Socket;
import java.net.UnknownHostException;


public class TcpClient extends Thread
{
	private String ip;
	private int port;

	private Socket socket = null;
	private InputStream input = null;
	private OutputStream output = null;


	public TcpClient(String ip, int port)
	{
		this.ip = ip;
		this.port = port;
	}


	public void run()
	{
		try
		{
			this.socket = new Socket(this.ip, this.port);
			this.input = this.socket.getInputStream();
			this.output = this.socket.getOutputStream();


			ReqTestXX reqTestXX = new ReqTestXX();
			reqTestXX.setIdU8((byte)255);
			reqTestXX.setIdU16((short)65535);
			reqTestXX.setIdU32(65535666);

			List<Byte> id_u8 = new ArrayList<Byte>();
			id_u8.add((byte)254);
			id_u8.add((byte)255);

			reqTestXX.setRepeatIdU8(id_u8);
			reqTestXX.setOptionalIdU8((byte)255);


			int header_len = 2;
			int max_buffer_len = 102400;
			int tmp_buffer_len = 1024;
			int buffer_len = 0;
			byte[] buffer = new byte[max_buffer_len];
			byte[] tmp_buffer = new byte[tmp_buffer_len];

			System.out.println("connect success......");


			this.output.write(reqTestXX.encode());
			this.output.flush();


			while (true)
			{
				int readLen = this.input.read(tmp_buffer);
				//System.out.println("readLen: " + readLen);
				System.arraycopy(tmp_buffer, 0, buffer, buffer_len, readLen);
				buffer_len += readLen;
				//System.out.println("buffer_len: " + buffer_len);

				if (buffer_len <= header_len)
				{
					continue;
				}
				while (true)
				{
					int package_len = PacketUtil.readUShort(buffer);
					//System.out.println("package_len: " + package_len);
					if (buffer_len < package_len + header_len)
					{
						break;
					}
					buffer_len -= package_len + header_len;
					byte[] buf = new byte[package_len];
					System.arraycopy(buffer, header_len, buf, 0, package_len);
					//System.arraycopy(buffer, 0, buffer, header_len + package_len, buffer_len);
					System.arraycopy(buffer, header_len + package_len, buffer, 0, buffer_len);
					//System.out.println("buffer_len: " + buffer_len);

					Packet packet = new Packet(buf);
					doMsg(packet);
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}


	private void doMsg(Packet packet)
	{
		try
		{
			short packetIdTmp = packet.readShort();
			int packetId = PacketUtil.readUShort(packetIdTmp);
			System.out.println();
			System.out.println("packetId: " + packetId);

			switch (packetId)
			{
				case Msg.P_ACK_TEST_X_X:
				{
					AckTestXX ackTestXX = new AckTestXX(packet);
					System.out.println("ackTestXX.getIdU8(): " + ackTestXX.getIdU8());
					System.out.println("ackTestXX.getIdU16(): " + ackTestXX.getIdU16());
					System.out.println("ackTestXX.getIdU32(): " + ackTestXX.getIdU32());


					MsgRoleBase msgRoleBase = new MsgRoleBase();
					msgRoleBase.setUid(12306);
					msgRoleBase.setUname("mirahs");

					List<Float> id_f32 = new ArrayList<Float>();
					id_f32.add(1.33f);
					id_f32.add(1.44f);

					ReqTestSend reqTestSend = new ReqTestSend();
					reqTestSend.setIdU8((byte)255);
					reqTestSend.setRoleBase(msgRoleBase);
					reqTestSend.setIdF32(id_f32);
					reqTestSend.setIdOpU8((byte)12);
					reqTestSend.setOpRoleBase(msgRoleBase);

					
					this.output.write(reqTestSend.encode());
					this.output.flush();

					break;
				}
				case Msg.P_ACK_TEST_SEND_OK:
				{
					AckTestSendOk ackTestSendOk = new AckTestSendOk(packet);
					System.out.println("ackTestSendOk.getIdU8(): " + ackTestSendOk.getIdU8());
					System.out.println("ackTestSendOk.getRoleBase().getUid(): " + ackTestSendOk.getRoleBase().getUid());
					System.out.println("ackTestSendOk.getRoleBase().getUname(): " + ackTestSendOk.getRoleBase().getUname());
					System.out.println("ackTestSendOk.getOpRoleBase().getUid(): " + ackTestSendOk.getOpRoleBase().getUid());
					System.out.println("ackTestSendOk.getOpRoleBase().getUname(): " + ackTestSendOk.getOpRoleBase().getUname());

					break;
				}
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}
