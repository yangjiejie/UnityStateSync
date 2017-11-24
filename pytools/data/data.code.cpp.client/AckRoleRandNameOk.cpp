#ifndef _ACK_ROLE_RAND_NAME_OK_
#define _ACK_ROLE_RAND_NAME_OK_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class AckRoleRandNameOk
{
private:
	String m_uname;


public:
	AckRoleRandNameOk(Packet* packet)
	{
		m_uname = packet->ReadString();
	}


	String GetUname()
	{
		return m_uname;
	}

};

#endif
