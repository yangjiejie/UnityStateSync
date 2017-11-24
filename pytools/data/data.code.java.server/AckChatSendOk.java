package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckChatSendOk
{
	private byte channel;
	private int uid;
	private String uname;
	private String content;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeByte(channel);
		packet.writeInt(uid);
		packet.writeString(uname);
		packet.writeString(content);
		return packet.encode((short)Msg.P_ACK_CHAT_SEND_OK);
	}



	public void setChannel(byte channel)
	{
		this.channel = channel;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public void setUname(String uname)
	{
		this.uname = uname;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

}
