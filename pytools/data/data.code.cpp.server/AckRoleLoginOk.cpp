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
	Packet Encode()
	{
		Packet packet;
		packet.WriteString(m_uname);
		packet.Encode(Msg::P_ACK_ROLE_LOGIN_OK);
		return packet;
	}


	void SetUname(String uname)
	{
		m_uname = uname;
	}

};

#endif
