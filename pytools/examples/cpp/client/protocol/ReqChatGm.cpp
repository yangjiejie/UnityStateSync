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
	Packet Encode()
	{
		Packet packet;
		packet.WriteString(m_content);
		packet.Encode(Msg::P_REQ_CHAT_GM);
		return packet;
	}


	void SetContent(String content)
	{
		m_content = content;
	}

};

#endif
