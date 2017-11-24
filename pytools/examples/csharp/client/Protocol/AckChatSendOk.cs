using System.Collections;
using System.Collections.Generic;


public class AckChatSendOk
{
	private byte _channel;
	private uint _uid;
	private string _uname;
	private string _content;


	public AckChatSendOk(Packet packet)
	{
		this._channel = packet.ReadByte();
		this._uid = packet.ReadUint();
		this._uname = packet.ReadString();
		this._content = packet.ReadString();
	}


	public byte channel
	{
		get { return this._channel; }
		set { this._channel = value; }
	}

	public uint uid
	{
		get { return this._uid; }
		set { this._uid = value; }
	}

	public string uname
	{
		get { return this._uname; }
		set { this._uname = value; }
	}

	public string content
	{
		get { return this._content; }
		set { this._content = value; }
	}

}
