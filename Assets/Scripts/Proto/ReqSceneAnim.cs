using System.Collections;
using System.Collections.Generic;


public class ReqSceneAnim
{
	private byte _skill1;
	private byte _skill2;
	private byte _skill3;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteByte(this._skill1);
		packet.WriteByte(this._skill2);
		packet.WriteByte(this._skill3);
		packet.Encode(Msg.P_REQ_SCENE_ANIM);
		return packet;
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
