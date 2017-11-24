#ifndef _REQ_ROLE_RAND_NAME_
#define _REQ_ROLE_RAND_NAME_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class ReqRoleRandName
{
private:


public:
	Packet Encode()
	{
		Packet packet;
		packet.Encode(Msg::P_REQ_ROLE_RAND_NAME);
		return packet;
	}


};

#endif
