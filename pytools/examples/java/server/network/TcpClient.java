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
	private Socket socket = null;
	private InputStream input = null;
	private OutputStream output = null;


	public TcpClient(Socket socket)
	{
		this.socket = socket;
		try
		{
			this.input = this.socket.getInputStream();
			this.output = this.socket.getOutputStream();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}


	public void run()
	{
		try
		{
			int header_len = 2;
			int max_buffer_len = 102400;
			int tmp_buffer_len = 1024;
			int buffer_len = 0;
			byte[] buffer = new byte[max_buffer_len];
			byte[] tmp_buffer = new byte[tmp_buffer_len];

			System.out.println("connect success......");

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
		short packetIdTmp = packet.readShort();
		int packetId = PacketUtil.readUShort(packetIdTmp);
		System.out.println();
		System.out.println("packetId: " + packetId);

		try
		{
			switch (packetId)
			{
				case Msg.P_REQ_TEST_X_X:
				{
					ReqTestXX reqTestXX = new ReqTestXX(packet);
					System.out.println("reqTestXX.getIdU8(): " + reqTestXX.getIdU8());
					System.out.println("reqTestXX.getIdU16(): " + reqTestXX.getIdU16());
					System.out.println("reqTestXX.getIdU32(): " + reqTestXX.getIdU32());


					AckTestXX ackTestXX = new AckTestXX();
					ackTestXX.setIdU8((byte)255);
					ackTestXX.setIdU16((short)65535);
					ackTestXX.setIdU32(65535666);

					List<Byte> id_u8 = new ArrayList<Byte>();
					id_u8.add((byte)254);
					id_u8.add((byte)255);

					ackTestXX.setRepeatIdU8(id_u8);
					ackTestXX.setOptionalIdU8((byte)255);

					this.output.write(ackTestXX.encode());
					this.output.flush();

					break;
				}
				case Msg.P_REQ_TEST_SEND:
				{
					ReqTestSend reqTestSend = new ReqTestSend(packet);
					System.out.println("reqTestSend.getIdU8(): " + reqTestSend.getIdU8());
					System.out.println("reqTestSend.getRoleBase().getUid(): " + reqTestSend.getRoleBase().getUid());
					System.out.println("reqTestSend.getRoleBase().getUname(): " + reqTestSend.getRoleBase().getUname());
					System.out.println("reqTestSend.getOpRoleBase().getUid(): " + reqTestSend.getOpRoleBase().getUid());
					System.out.println("reqTestSend.getOpRoleBase().getUname(): " + reqTestSend.getOpRoleBase().getUname());


					MsgRoleBase msgRoleBase = new MsgRoleBase();
					msgRoleBase.setUid(12306);
					msgRoleBase.setUname("mirahs");

					List<Float> id_f32 = new ArrayList<Float>();
					id_f32.add(1.33f);
					id_f32.add(1.44f);

					AckTestSendOk ackTestSendOk = new AckTestSendOk();
					ackTestSendOk.setIdU8((byte)255);
					ackTestSendOk.setRoleBase(msgRoleBase);
					ackTestSendOk.setIdF32(id_f32);
					ackTestSendOk.setIdOpU8((byte)12);
					ackTestSendOk.setOpRoleBase(msgRoleBase);

					
					this.output.write(ackTestSendOk.encode());
					this.output.flush();

					break;
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
