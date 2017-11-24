package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckScenePlayers
{
	private List<Msgsceneplayer> players = new ArrayList<Msgsceneplayer>();


	public AckScenePlayers(Packet packet)
	{
		int players_count = PacketUtil.readUShort(packet.readShort());
		for (int i = 0; i < players_count; i++)
		{
			players.add(new MsgScenePlayer(packet));
		}
	}



	public List<Msgsceneplayer> getPlayers()
	{
		return this.players;
	}

}
