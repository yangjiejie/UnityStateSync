using System.Collections;
using System.Collections.Generic;


public class AckChatSendOk
{
	private byte _channel;
	private uint _uid;
	private string _uname;
	private string _content;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteByte(this._channel);
		packet.WriteUint(this._uid);
		packet.WriteString(this._uname);
		packet.WriteString(this._content);
		packet.Encode(Msg.P_ACK_CHAT_SEND_OK);
		return packet;
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
