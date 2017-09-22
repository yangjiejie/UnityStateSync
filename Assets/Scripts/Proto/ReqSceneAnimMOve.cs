using System.Collections;
using System.Collections.Generic;


public class ReqSceneAnimMove
{
	private byte _is_move;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteByte(this._is_move);
		packet.Encode(Msg.P_REQ_SCENE_ANIM_MOVE);
		return packet;
	}


	public byte is_move
	{
		get { return this._is_move; }
		set { this._is_move = value; }
	}

}
