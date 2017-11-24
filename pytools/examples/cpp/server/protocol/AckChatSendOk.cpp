#ifndef _ACK_CHAT_SEND_OK_
#define _ACK_CHAT_SEND_OK_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class AckChatSendOk
{
private:
	U8 m_channel;
	U32 m_uid;
	String m_uname;
	String m_content;


public:
	Packet Encode()
	{
		Packet packet;
		packet.WriteU8(m_channel);
		packet.WriteU32(m_uid);
		packet.WriteString(m_uname);
		packet.WriteString(m_content);
		packet.Encode(Msg::P_ACK_CHAT_SEND_OK);
		return packet;
	}


	void SetChannel(U8 channel)
	{
		m_channel = channel;
	}

	void SetUid(U32 uid)
	{
		m_uid = uid;
	}

	void SetUname(String uname)
	{
		m_uname = uname;
	}

	void SetContent(String content)
	{
		m_content = content;
	}

};

#endif
