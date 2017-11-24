#ifndef _ACK_ROLE_LOGIN_OK_NO_ROLE_
#define _ACK_ROLE_LOGIN_OK_NO_ROLE_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class AckRoleLoginOkNoRole
{
private:


public:
	Packet Encode()
	{
		Packet packet;
		packet.Encode(Msg::P_ACK_ROLE_LOGIN_OK_NO_ROLE);
		return packet;
	}


};

#endif
