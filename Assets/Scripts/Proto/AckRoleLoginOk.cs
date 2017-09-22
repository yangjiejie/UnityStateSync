using System.Collections;
using System.Collections.Generic;


public class AckRoleLoginOk
{
	private uint _uid;
	private string _uname;
	private float _pos_x;
	private float _pos_y;
	private float _pos_z;


	public AckRoleLoginOk(Packet packet)
	{
		this._uid = packet.ReadUint();
		this._uname = packet.ReadString();
		this._pos_x = packet.ReadFloat();
		this._pos_y = packet.ReadFloat();
		this._pos_z = packet.ReadFloat();
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

}
