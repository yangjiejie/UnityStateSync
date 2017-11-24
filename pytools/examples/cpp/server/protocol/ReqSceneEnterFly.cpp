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
	ReqSceneEnterFly(Packet* packet)
	{
		m_map_id = packet->ReadU32();
	}


	U32 GetMapId()
	{
		return m_map_id;
	}

};

#endif
