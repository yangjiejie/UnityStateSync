using System.Collections;
using System.Collections.Generic;


public class ReqScenePosRot
{
	private MsgScenePosRot _posrot;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteBuffer(this._posrot.GetBuffer());
		packet.Encode(Msg.P_REQ_SCENE_POS_ROT);
		return packet;
	}


	public MsgScenePosRot posrot
	{
		get { return this._posrot; }
		set { this._posrot = value; }
	}

}
