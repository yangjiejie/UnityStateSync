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


	public ReqChatSend(Packet packet)
	{
		channel = packet.readByte();
		dest_uid = packet.readInt();
		content = packet.readString();
	}



	public int getChannel()
	{
		return PacketUtil.readUByte(this.channel);
	}

	public long getDestUid()
	{
		return PacketUtil.readUInt(this.dest_uid);
	}

	public String getContent()
	{
		return this.content;
	}

}
