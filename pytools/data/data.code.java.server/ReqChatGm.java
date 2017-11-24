package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqChatGm
{
	private String content;


	public ReqChatGm(Packet packet)
	{
		content = packet.readString();
	}



	public String getContent()
	{
		return this.content;
	}

}
