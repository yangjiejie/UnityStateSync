using System.Collections;
using System.Collections.Generic;


public class AckSceneExit
{
	private uint _uid;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUint(this._uid);
		packet.Encode(Msg.P_ACK_SCENE_EXIT);
		return packet;
	}


	public uint uid
	{
		get { return this._uid; }
		set { this._uid = value; }
	}

}
