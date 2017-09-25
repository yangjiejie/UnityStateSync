using System.Collections;
using System.Collections.Generic;


public class AckSceneAnimOk
{
	private uint _uid;
	private byte _skill1;
	private byte _skill2;
	private byte _skill3;


	public AckSceneAnimOk(Packet packet)
	{
		this._uid = packet.ReadUint();
		this._skill1 = packet.ReadByte();
		this._skill2 = packet.ReadByte();
		this._skill3 = packet.ReadByte();
	}


	public uint uid
	{
		get { return this._uid; }
		set { this._uid = value; }
	}

	public byte skill1
	{
		get { return this._skill1; }
		set { this._skill1 = value; }
	}

	public byte skill2
	{
		get { return this._skill2; }
		set { this._skill2 = value; }
	}

	public byte skill3
	{
		get { return this._skill3; }
		set { this._skill3 = value; }
	}

}
