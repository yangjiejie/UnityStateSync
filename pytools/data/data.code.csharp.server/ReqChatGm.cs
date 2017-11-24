using System.Collections;
using System.Collections.Generic;


public class ReqChatGm
{
	private string _content;


	public ReqChatGm(Packet packet)
	{
		this._content = packet.ReadString();
	}


	public string content
	{
		get { return this._content; }
		set { this._content = value; }
	}

}
