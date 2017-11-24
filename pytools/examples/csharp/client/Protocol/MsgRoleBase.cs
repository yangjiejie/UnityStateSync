using System.Collections;
using System.Collections.Generic;


public class MsgRoleBase
{
	private uint _uid;
	private string _uname;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUint(this._uid);
		packet.WriteString(this._uname);
		return packet;
	}

	public MsgRoleBase()
	{
	}

	public MsgRoleBase(Packet packet)
	{
		this._uid = packet.ReadUint();
		this._uname = packet.ReadString();
	}

	public List<byte> GetBuffer()
	{
		return this.Encode().GetBuffer();
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

}
