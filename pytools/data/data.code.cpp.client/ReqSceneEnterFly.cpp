#ifndef _REQ_SCENE_ENTER_FLY_
#define _REQ_SCENE_ENTER_FLY_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class ReqSceneEnterFly
{
private:
	U32 m_map_id;


public:
	Packet Encode()
	{
		Packet packet;
		packet.WriteU32(m_map_id);
		packet.Encode(Msg::P_REQ_SCENE_ENTER_FLY);
		return packet;
	}


	void SetMapId(U32 map_id)
	{
		m_map_id = map_id;
	}

};

#endif
