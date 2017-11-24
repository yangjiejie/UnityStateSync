#ifndef _REQ_ROLE_CREATE_
#define _REQ_ROLE_CREATE_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class ReqRoleCreate
{
private:
	U32 m_uid;
	U32 m_uuid;
	U16 m_sid;
	U16 m_cid;
	String m_os;
	String m_version;
	String m_uname;
	String m_source;
	String m_source_sub;
	U32 m_login_time;


public:
	ReqRoleCreate(Packet* packet)
	{
		m_uid = packet->ReadU32();
		m_uuid = packet->ReadU32();
		m_sid = packet->ReadU16();
		m_cid = packet->ReadU16();
		m_os = packet->ReadString();
		m_version = packet->ReadString();
		m_uname = packet->ReadString();
		m_source = packet->ReadString();
		m_source_sub = packet->ReadString();
		m_login_time = packet->ReadU32();
	}


	U32 GetUid()
	{
		return m_uid;
	}

	U32 GetUuid()
	{
		return m_uuid;
	}

	U16 GetSid()
	{
		return m_sid;
	}

	U16 GetCid()
	{
		return m_cid;
	}

	String GetOs()
	{
		return m_os;
	}

	String GetVersion()
	{
		return m_version;
	}

	String GetUname()
	{
		return m_uname;
	}

	String GetSource()
	{
		return m_source;
	}

	String GetSourceSub()
	{
		return m_source_sub;
	}

	U32 GetLoginTime()
	{
		return m_login_time;
	}

};

#endif
