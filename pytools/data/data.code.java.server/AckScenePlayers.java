package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckScenePlayers
{
	private List<Msgsceneplayer> players = new ArrayList<Msgsceneplayer>();


	public byte[] encode()
	{
		Packet packet = new Packet();
		int players_count = players.size();
		packet.writeShort((short)players_count);
		for (int i = 0; i < players_count; i++)
		{
			packet.writeBytes(players.get(i).getBytes());
		}
		return packet.encode((short)Msg.P_ACK_SCENE_PLAYERS);
	}



	public void setPlayers(List<Msgsceneplayer> players)
	{
		this.players = players;
	}

}
