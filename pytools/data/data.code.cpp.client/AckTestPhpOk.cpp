#ifndef _ACK_TEST_PHP_OK_
#define _ACK_TEST_PHP_OK_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>

#include <MsgTestPhp.cpp>
#include <MsgTestPhp.cpp>
#include <MsgTestPhp.cpp>


class AckTestPhpOk
{
private:
	U64 m_u64;
	String m_strxx;
	MsgTestPhp* m_msg_req;
	U8 m_msg_opt_flag;
	MsgTestPhp* m_msg_opt;
	list<MsgTestPhp*> m_msg_rep;


public:
	AckTestPhpOk(Packet* packet)
	{
		m_u64 = packet->ReadU64();
		m_strxx = packet->ReadString();
		m_msg_req = new MsgTestPhp(packet);
		m_msg_opt_flag = packet->ReadU8();
		if (m_msg_opt_flag == 1)
		{
			m_msg_opt = new MsgTestPhp(packet);
		}
		U16 msg_rep_count = packet->ReadU16();
		for (U16 i = 0; i < msg_rep_count; i++)
		{
			m_msg_rep.push_back(new MsgTestPhp(packet));
		}
	}


	U64 GetU64()
	{
		return m_u64;
	}

	String GetStrxx()
	{
		return m_strxx;
	}

	MsgTestPhp* GetMsgReq()
	{
		return m_msg_req;
	}

	MsgTestPhp* GetMsgOpt()
	{
		return m_msg_opt;
	}

	list<MsgTestPhp*> GetMsgRep()
	{
		return m_msg_rep;
	}

};

#endif
