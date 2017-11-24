package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqChatSend
{
	private byte channel;
	private int dest_uid;
	private String content;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeByte(channel);
		packet.writeInt(dest_uid);
		packet.writeString(content);
		return packet.encode((short)Msg.P_REQ_CHAT_SEND);
	}



	public void setChannel(byte channel)
	{
		this.channel = channel;
	}

	public void setDestUid(int dest_uid)
	{
		this.dest_uid = dest_uid;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

}
