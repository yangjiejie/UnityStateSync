#ifndef _ACK_SCENE_PLAYERS_
#define _ACK_SCENE_PLAYERS_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>

#include <MsgScenePlayer.cpp>


class AckScenePlayers
{
private:
	list<MsgScenePlayer*> m_players;


public:
	AckScenePlayers(Packet* packet)
	{
		U16 players_count = packet->ReadU16();
		for (U16 i = 0; i < players_count; i++)
		{
			m_players.push_back(new MsgScenePlayer(packet));
		}
	}


	list<MsgScenePlayer*> GetPlayers()
	{
		return m_players;
	}

};

#endif
