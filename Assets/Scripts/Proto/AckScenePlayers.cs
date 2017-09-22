using System.Collections;
using System.Collections.Generic;


public class AckScenePlayers
{
	private List<MsgScenePlayer> _players = new List<MsgScenePlayer>();


	public AckScenePlayers(Packet packet)
	{
		this._players = new List<MsgScenePlayer>();
		ushort players_count = packet.ReadUshort();
		for (ushort i = 0; i < players_count; i++)
		{
			this._players.Add(new MsgScenePlayer(packet));
		}
	}


	public List<MsgScenePlayer> players
	{
		get { return this._players; }
		set { this._players = value; }
	}

}
