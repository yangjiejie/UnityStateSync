using System.Collections;
using System.Collections.Generic;


public class AckScenePosRotOk
{
	private uint _uid;
	private MsgScenePosRot _posrot;


	public AckScenePosRotOk(Packet packet)
	{
		this._uid = packet.ReadUint();
		this._posrot = new MsgScenePosRot(packet);
	}


	public uint uid
	{
		get { return this._uid; }
		set { this._uid = value; }
	}

	public MsgScenePosRot posrot
	{
		get { return this._posrot; }
		set { this._posrot = value; }
	}

}
