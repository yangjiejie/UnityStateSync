#ifndef _ACK_SCENE_ENTER_
#define _ACK_SCENE_ENTER_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>

#include <MsgScenePlayer.cpp>


class AckSceneEnter
{
private:
	MsgScenePlayer* m_player;


public:
	Packet Encode()
	{
		Packet packet;
		U32 player_buff_len = 0;
		BYTE* player_buff = m_player->GetBytes(&player_buff_len);
		packet.WriteBytes(player_buff, player_buff_len);
		packet.Encode(Msg::P_ACK_SCENE_ENTER);
		return packet;
	}


	void SetPlayer(MsgScenePlayer* player)
	{
		m_player = player;
	}

};

#endif
