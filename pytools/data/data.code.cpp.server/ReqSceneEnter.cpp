#ifndef _REQ_SCENE_ENTER_
#define _REQ_SCENE_ENTER_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class ReqSceneEnter
{
private:
	U32 m_door_id;


public:
	ReqSceneEnter(Packet* packet)
	{
		m_door_id = packet->ReadU32();
	}


	U32 GetDoorId()
	{
		return m_door_id;
	}

};

#endif
