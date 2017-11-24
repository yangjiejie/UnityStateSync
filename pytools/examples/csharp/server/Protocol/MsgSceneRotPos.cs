using System.Collections;
using System.Collections.Generic;


public class MsgSceneRotPos
{
	private short _rot_x;
	private short _rot_y;
	private short _rot_z;
	private short _pos_x;
	private short _pos_y;
	private short _pos_z;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteShort(this._rot_x);
		packet.WriteShort(this._rot_y);
		packet.WriteShort(this._rot_z);
		packet.WriteShort(this._pos_x);
		packet.WriteShort(this._pos_y);
		packet.WriteShort(this._pos_z);
		return packet;
	}

	public MsgSceneRotPos()
	{
	}

	public MsgSceneRotPos(Packet packet)
	{
		this._rot_x = packet.ReadShort();
		this._rot_y = packet.ReadShort();
		this._rot_z = packet.ReadShort();
		this._pos_x = packet.ReadShort();
		this._pos_y = packet.ReadShort();
		this._pos_z = packet.ReadShort();
	}

	public List<byte> GetBuffer()
	{
		return this.Encode().GetBuffer();
	}


	public short rot_x
	{
		get { return this._rot_x; }
		set { this._rot_x = value; }
	}

	public short rot_y
	{
		get { return this._rot_y; }
		set { this._rot_y = value; }
	}

	public short rot_z
	{
		get { return this._rot_z; }
		set { this._rot_z = value; }
	}

	public short pos_x
	{
		get { return this._pos_x; }
		set { this._pos_x = value; }
	}

	public short pos_y
	{
		get { return this._pos_y; }
		set { this._pos_y = value; }
	}

	public short pos_z
	{
		get { return this._pos_z; }
		set { this._pos_z = value; }
	}

}
