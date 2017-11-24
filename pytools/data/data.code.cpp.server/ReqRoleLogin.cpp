#ifndef _REQ_ROLE_LOGIN_
#define _REQ_ROLE_LOGIN_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class ReqRoleLogin
{
private:
	U32 m_uid;
	U32 m_uuid;
	U16 m_sid;
	U16 m_cid;
	U32 m_login_time;
	String m_pwd;
	U8 m_relink;
	U8 m_debug;
	String m_os;
	String m_version;


public:
	ReqRoleLogin(Packet* packet)
	{
		m_uid = packet->ReadU32();
		m_uuid = packet->ReadU32();
		m_sid = packet->ReadU16();
		m_cid = packet->ReadU16();
		m_login_time = packet->ReadU32();
		m_pwd = packet->ReadString();
		m_relink = packet->ReadU8();
		m_debug = packet->ReadU8();
		m_os = packet->ReadString();
		m_version = packet->ReadString();
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

	U32 GetLoginTime()
	{
		return m_login_time;
	}

	String GetPwd()
	{
		return m_pwd;
	}

	U8 GetRelink()
	{
		return m_relink;
	}

	U8 GetDebug()
	{
		return m_debug;
	}

	String GetOs()
	{
		return m_os;
	}

	String GetVersion()
	{
		return m_version;
	}

};

#endif
