package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqChatGm
{
	private String content;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeString(content);
		return packet.encode((short)Msg.P_REQ_CHAT_GM);
	}



	public void setContent(String content)
	{
		this.content = content;
	}

}
