#ifndef _REQ_CHAT_GM_
#define _REQ_CHAT_GM_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class ReqChatGm
{
private:
	String m_content;


public:
	ReqChatGm(Packet* packet)
	{
		m_content = packet->ReadString();
	}


	String GetContent()
	{
		return m_content;
	}

};

#endif
