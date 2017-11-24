#ifndef _ACK_SCENE_EXIT_
#define _ACK_SCENE_EXIT_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class AckSceneExit
{
private:
	U32 m_uid;


public:
	AckSceneExit(Packet* packet)
	{
		m_uid = packet->ReadU32();
	}


	U32 GetUid()
	{
		return m_uid;
	}

};

#endif
