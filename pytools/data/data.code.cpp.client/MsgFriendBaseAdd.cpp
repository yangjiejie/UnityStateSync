#ifndef _MSG_FRIEND_BASE_ADD_
#define _MSG_FRIEND_BASE_ADD_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class MsgFriendBaseAdd
{
private:
	U32 m_uid;
	String m_uname;


public:
	BYTE* Encode(U32* len)
	{
		Packet packet;
		packet.WriteU32(m_uid);
		packet.WriteString(m_uname);
		return packet.ReadBytes(len);
	}

	MsgFriendBaseAdd()
	{

	}

	MsgFriendBaseAdd(Packet* packet)
	{
		m_uid = packet->ReadU32();
		m_uname = packet->ReadString();
	}

	BYTE* GetBytes(U32* len)
	{
		return Encode(len);
	}


	void SetUid(U32 uid)
	{
		m_uid = uid;
	}
	U32 GetUid()
	{
		return m_uid;
	}

	void SetUname(String uname)
	{
		m_uname = uname;
	}
	String GetUname()
	{
		return m_uname;
	}

};

#endif
