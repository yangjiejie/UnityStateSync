using System.Collections;
using System.Collections.Generic;


public class ReqChatGm
{
	private string _content;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteString(this._content);
		packet.Encode(Msg.P_REQ_CHAT_GM);
		return packet;
	}


	public string content
	{
		get { return this._content; }
		set { this._content = value; }
	}

}
