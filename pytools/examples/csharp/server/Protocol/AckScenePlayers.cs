using System.Collections;
using System.Collections.Generic;


public class AckScenePlayers
{
	private List<MsgScenePlayer> _players = new List<MsgScenePlayer>();


	public Packet Encode()
	{
		Packet packet = new Packet();
		ushort players_count = (ushort)this._players.Count;
		packet.WriteUshort(players_count);
		for (ushort i = 0; i < players_count; i++)
		{
			MsgScenePlayer xxx = this._players[i];
			packet.WriteBuffer(xxx.GetBuffer());
		}
		packet.Encode(Msg.P_ACK_SCENE_PLAYERS);
		return packet;
	}


	public List<MsgScenePlayer> players
	{
		get { return this._players; }
		set { this._players = value; }
	}

}
