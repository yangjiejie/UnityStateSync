#ifndef _REQ_CHAT_SEND_
#define _REQ_CHAT_SEND_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class ReqChatSend
{
private:
	U8 m_channel;
	U32 m_dest_uid;
	String m_content;


public:
	Packet Encode()
	{
		Packet packet;
		packet.WriteU8(m_channel);
		packet.WriteU32(m_dest_uid);
		packet.WriteString(m_content);
		packet.Encode(Msg::P_REQ_CHAT_SEND);
		return packet;
	}


	void SetChannel(U8 channel)
	{
		m_channel = channel;
	}

	void SetDestUid(U32 dest_uid)
	{
		m_dest_uid = dest_uid;
	}

	void SetContent(String content)
	{
		m_content = content;
	}

};

#endif
