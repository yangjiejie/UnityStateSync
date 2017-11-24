using System.Collections;
using System.Collections.Generic;


public class ReqChatSend
{
	private byte _channel;
	private uint _dest_uid;
	private string _content;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteByte(this._channel);
		packet.WriteUint(this._dest_uid);
		packet.WriteString(this._content);
		packet.Encode(Msg.P_REQ_CHAT_SEND);
		return packet;
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
