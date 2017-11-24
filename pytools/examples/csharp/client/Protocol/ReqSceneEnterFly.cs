using System.Collections;
using System.Collections.Generic;


public class ReqSceneEnterFly
{
	private uint _map_id;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUint(this._map_id);
		packet.Encode(Msg.P_REQ_SCENE_ENTER_FLY);
		return packet;
	}


	public uint map_id
	{
		get { return this._map_id; }
		set { this._map_id = value; }
	}

}
