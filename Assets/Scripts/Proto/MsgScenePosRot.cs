using System.Collections;
using System.Collections.Generic;


public class MsgScenePosRot
{
	private float _pos_x;
	private float _pos_y;
	private float _pos_z;
	private float _rot_x;
	private float _rot_y;
	private float _rot_z;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteFloat(this._pos_x);
		packet.WriteFloat(this._pos_y);
		packet.WriteFloat(this._pos_z);
		packet.WriteFloat(this._rot_x);
		packet.WriteFloat(this._rot_y);
		packet.WriteFloat(this._rot_z);
		return packet;
	}

	public MsgScenePosRot()
	{
	}

	public MsgScenePosRot(Packet packet)
	{
		this._pos_x = packet.ReadFloat();
		this._pos_y = packet.ReadFloat();
		this._pos_z = packet.ReadFloat();
		this._rot_x = packet.ReadFloat();
		this._rot_y = packet.ReadFloat();
		this._rot_z = packet.ReadFloat();
	}

	public List<byte> GetBuffer()
	{
		return this.Encode().GetBuffer();
	}


	public float pos_x
	{
		get { return this._pos_x; }
		set { this._pos_x = value; }
	}

	public float pos_y
	{
		get { return this._pos_y; }
		set { this._pos_y = value; }
	}

	public float pos_z
	{
		get { return this._pos_z; }
		set { this._pos_z = value; }
	}

	public float rot_x
	{
		get { return this._rot_x; }
		set { this._rot_x = value; }
	}

	public float rot_y
	{
		get { return this._rot_y; }
		set { this._rot_y = value; }
	}

	public float rot_z
	{
		get { return this._rot_z; }
		set { this._rot_z = value; }
	}

}
