using System.Collections;
using System.Collections.Generic;


public class AckSceneExit
{
	private uint _uid;


	public AckSceneExit(Packet packet)
	{
		this._uid = packet.ReadUint();
	}


	public uint uid
	{
		get { return this._uid; }
		set { this._uid = value; }
	}

}
