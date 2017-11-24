using System.Collections;
using System.Collections.Generic;


public class ReqChatSend
{
	private byte _channel;
	private uint _dest_uid;
	private string _content;


	public ReqChatSend(Packet packet)
	{
		this._channel = packet.ReadByte();
		this._dest_uid = packet.ReadUint();
		this._content = packet.ReadString();
	}


	public byte channel
	{
		get { return this._channel; }
		set { this._channel = value; }
	}

	public uint dest_uid
	{
		get { return this._dest_uid; }
		set { this._dest_uid = value; }
	}

	public string content
	{
		get { return this._content; }
		set { this._content = value; }
	}

}
