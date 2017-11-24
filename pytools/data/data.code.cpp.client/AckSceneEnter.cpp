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
	AckSceneEnter(Packet* packet)
	{
		m_player = new MsgScenePlayer(packet);
	}


	MsgScenePlayer* GetPlayer()
	{
		return m_player;
	}

};

#endif
