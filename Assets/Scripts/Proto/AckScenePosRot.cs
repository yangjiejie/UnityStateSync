using System.Collections;
using System.Collections.Generic;


public class AckScenePosRot
{
	private MsgScenePosRot _posrot;


	public AckScenePosRot(Packet packet)
	{
		this._posrot = new MsgScenePosRot(packet);
	}


	public MsgScenePosRot posrot
	{
		get { return this._posrot; }
		set { this._posrot = value; }
	}

}
