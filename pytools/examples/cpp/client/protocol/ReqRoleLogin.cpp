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
	Packet Encode()
	{
		Packet packet;
		packet.WriteU32(m_uid);
		packet.WriteU32(m_uuid);
		packet.WriteU16(m_sid);
		packet.WriteU16(m_cid);
		packet.WriteU32(m_login_time);
		packet.WriteString(m_pwd);
		packet.WriteU8(m_relink);
		packet.WriteU8(m_debug);
		packet.WriteString(m_os);
		packet.WriteString(m_version);
		packet.Encode(Msg::P_REQ_ROLE_LOGIN);
		return packet;
	}


	void SetUid(U32 uid)
	{
		m_uid = uid;
	}

	void SetUuid(U32 uuid)
	{
		m_uuid = uuid;
	}

	void SetSid(U16 sid)
	{
		m_sid = sid;
	}

	void SetCid(U16 cid)
	{
		m_cid = cid;
	}

	void SetLoginTime(U32 login_time)
	{
		m_login_time = login_time;
	}

	void SetPwd(String pwd)
	{
		m_pwd = pwd;
	}

	void SetRelink(U8 relink)
	{
		m_relink = relink;
	}

	void SetDebug(U8 debug)
	{
		m_debug = debug;
	}

	void SetOs(String os)
	{
		m_os = os;
	}

	void SetVersion(String version)
	{
		m_version = version;
	}

};

#endif
