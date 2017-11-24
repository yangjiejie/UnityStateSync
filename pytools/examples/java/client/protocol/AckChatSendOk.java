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


	public AckChatSendOk(Packet packet)
	{
		channel = packet.readByte();
		uid = packet.readInt();
		uname = packet.readString();
		content = packet.readString();
	}



	public int getChannel()
	{
		return PacketUtil.readUByte(this.channel);
	}

	public long getUid()
	{
		return PacketUtil.readUInt(this.uid);
	}

	public String getUname()
	{
		return this.uname;
	}

	public String getContent()
	{
		return this.content;
	}

}
