#ifndef _ACK_ROLE_LOGIN_OK_
#define _ACK_ROLE_LOGIN_OK_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class AckRoleLoginOk
{
private:
	String m_uname;


public:
	AckRoleLoginOk(Packet* packet)
	{
		m_uname = packet->ReadString();
	}


	String GetUname()
	{
		return m_uname;
	}

};

#endif
