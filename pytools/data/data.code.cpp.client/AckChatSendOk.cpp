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
	AckChatSendOk(Packet* packet)
	{
		m_channel = packet->ReadU8();
		m_uid = packet->ReadU32();
		m_uname = packet->ReadString();
		m_content = packet->ReadString();
	}


	U8 GetChannel()
	{
		return m_channel;
	}

	U32 GetUid()
	{
		return m_uid;
	}

	String GetUname()
	{
		return m_uname;
	}

	String GetContent()
	{
		return m_content;
	}

};

#endif
