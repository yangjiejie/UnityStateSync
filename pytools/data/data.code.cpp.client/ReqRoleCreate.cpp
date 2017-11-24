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
	Packet Encode()
	{
		Packet packet;
		packet.WriteU32(m_uid);
		packet.WriteU32(m_uuid);
		packet.WriteU16(m_sid);
		packet.WriteU16(m_cid);
		packet.WriteString(m_os);
		packet.WriteString(m_version);
		packet.WriteString(m_uname);
		packet.WriteString(m_source);
		packet.WriteString(m_source_sub);
		packet.WriteU32(m_login_time);
		packet.Encode(Msg::P_REQ_ROLE_CREATE);
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

	void SetOs(String os)
	{
		m_os = os;
	}

	void SetVersion(String version)
	{
		m_version = version;
	}

	void SetUname(String uname)
	{
		m_uname = uname;
	}

	void SetSource(String source)
	{
		m_source = source;
	}

	void SetSourceSub(String source_sub)
	{
		m_source_sub = source_sub;
	}

	void SetLoginTime(U32 login_time)
	{
		m_login_time = login_time;
	}

};

#endif
