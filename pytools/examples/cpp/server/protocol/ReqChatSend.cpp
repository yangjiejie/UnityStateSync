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
	ReqChatSend(Packet* packet)
	{
		m_channel = packet->ReadU8();
		m_dest_uid = packet->ReadU32();
		m_content = packet->ReadString();
	}


	U8 GetChannel()
	{
		return m_channel;
	}

	U32 GetDestUid()
	{
		return m_dest_uid;
	}

	String GetContent()
	{
		return m_content;
	}

};

#endif
