using System.Collections;
using System.Collections.Generic;


public class ReqSceneEnter
{
	private uint _door_id;


	public ReqSceneEnter(Packet packet)
	{
		this._door_id = packet.ReadUint();
	}


	public uint door_id
	{
		get { return this._door_id; }
		set { this._door_id = value; }
	}

}
