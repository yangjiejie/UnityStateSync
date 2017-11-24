using System.Collections;
using System.Collections.Generic;


public class MsgSceneVector3
{
	private short _x;
	private short _y;
	private short _z;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteShort(this._x);
		packet.WriteShort(this._y);
		packet.WriteShort(this._z);
		return packet;
	}

	public MsgSceneVector3()
	{
	}

	public MsgSceneVector3(Packet packet)
	{
		this._x = packet.ReadShort();
		this._y = packet.ReadShort();
		this._z = packet.ReadShort();
	}

	public List<byte> GetBuffer()
	{
		return this.Encode().GetBuffer();
	}


	public short x
	{
		get { return this._x; }
		set { this._x = value; }
	}

	public short y
	{
		get { return this._y; }
		set { this._y = value; }
	}

	public short z
	{
		get { return this._z; }
		set { this._z = value; }
	}

}
