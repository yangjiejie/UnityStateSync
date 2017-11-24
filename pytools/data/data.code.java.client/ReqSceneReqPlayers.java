package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqSceneReqPlayers
{


	public byte[] encode()
	{
		Packet packet = new Packet();
		return packet.encode((short)Msg.P_REQ_SCENE_REQ_PLAYERS);
	}



}
