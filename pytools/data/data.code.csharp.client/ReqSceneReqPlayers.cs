using System.Collections;
using System.Collections.Generic;


public class ReqSceneReqPlayers
{


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.Encode(Msg.P_REQ_SCENE_REQ_PLAYERS);
		return packet;
	}



}
