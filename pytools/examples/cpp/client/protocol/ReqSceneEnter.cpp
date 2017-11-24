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
	Packet Encode()
	{
		Packet packet;
		packet.WriteU32(m_door_id);
		packet.Encode(Msg::P_REQ_SCENE_ENTER);
		return packet;
	}


	void SetDoorId(U32 door_id)
	{
		m_door_id = door_id;
	}

};

#endif
