using System.Collections;
using System.Collections.Generic;


public class AckSceneAnimMOve
{
	private uint _uid;
	private byte _is_move;


	public AckSceneAnimMOve(Packet packet)
	{
		this._uid = packet.ReadUint();
		this._is_move = packet.ReadByte();
	}


	public uint uid
	{
		get { return this._uid; }
		set { this._uid = value; }
	}

	public byte is_move
	{
		get { return this._is_move; }
		set { this._is_move = value; }
	}

}
