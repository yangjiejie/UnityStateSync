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
	Packet Encode()
	{
		Packet packet;
		packet.WriteU32(m_uid);
		packet.Encode(Msg::P_ACK_SCENE_EXIT);
		return packet;
	}


	void SetUid(U32 uid)
	{
		m_uid = uid;
	}

};

#endif
