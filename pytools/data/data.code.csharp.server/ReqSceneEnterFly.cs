using System.Collections;
using System.Collections.Generic;


public class ReqSceneEnterFly
{
	private uint _map_id;


	public ReqSceneEnterFly(Packet packet)
	{
		this._map_id = packet.ReadUint();
	}


	public uint map_id
	{
		get { return this._map_id; }
		set { this._map_id = value; }
	}

}
