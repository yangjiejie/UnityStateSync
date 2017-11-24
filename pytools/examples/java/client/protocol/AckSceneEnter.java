package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckSceneEnter
{
	private MsgScenePlayer player;


	public AckSceneEnter(Packet packet)
	{
		player = new MsgScenePlayer(packet);
	}



	public MsgScenePlayer getPlayer()
	{
		return this.player;
	}

}
