#ifndef _REQ_SCENE_REQ_PLAYERS_
#define _REQ_SCENE_REQ_PLAYERS_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class ReqSceneReqPlayers
{
private:


public:
	Packet Encode()
	{
		Packet packet;
		packet.Encode(Msg::P_REQ_SCENE_REQ_PLAYERS);
		return packet;
	}


};

#endif
