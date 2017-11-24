using System.Collections;
using System.Collections.Generic;


public class ReqSceneEnter
{
	private uint _door_id;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUint(this._door_id);
		packet.Encode(Msg.P_REQ_SCENE_ENTER);
		return packet;
	}


	public uint door_id
	{
		get { return this._door_id; }
		set { this._door_id = value; }
	}

}
