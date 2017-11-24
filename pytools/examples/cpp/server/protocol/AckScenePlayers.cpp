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
	Packet Encode()
	{
		Packet packet;
		U16 players_count = (U16)m_players.size();
		packet.WriteU16(players_count);
		for (list<MsgScenePlayer*>::iterator i = m_players.begin(); i != m_players.end(); i++)
		{
			U32 players_buff_len = 0;
			MsgScenePlayer* xx = (MsgScenePlayer*)*i;
			BYTE* players_buff = xx->GetBytes(&players_buff_len);
			packet.WriteBytes(players_buff, players_buff_len);
		}
		packet.Encode(Msg::P_ACK_SCENE_PLAYERS);
		return packet;
	}


	void SetPlayers(list<MsgScenePlayer*> players)
	{
		m_players = players;
	}

};

#endif
