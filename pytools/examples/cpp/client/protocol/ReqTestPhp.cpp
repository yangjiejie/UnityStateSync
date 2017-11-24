#ifndef _REQ_TEST_PHP_
#define _REQ_TEST_PHP_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>

#include <MsgTestPhp.cpp>
#include <MsgTestPhp.cpp>
#include <MsgTestPhp.cpp>


class ReqTestPhp
{
private:
	U64 m_u64;
	String m_strxx;
	MsgTestPhp* m_msg_req;
	U8 m_msg_opt_flag;
	MsgTestPhp* m_msg_opt;
	list<MsgTestPhp*> m_msg_rep;


public:
	Packet Encode()
	{
		Packet packet;
		packet.WriteU64(m_u64);
		packet.WriteString(m_strxx);
		U32 msg_req_buff_len = 0;
		BYTE* msg_req_buff = m_msg_req->GetBytes(&msg_req_buff_len);
		packet.WriteBytes(msg_req_buff, msg_req_buff_len);
		packet.WriteU8(m_msg_opt_flag);
		if (m_msg_opt_flag == 1)
		{
			U32 msg_opt_buff_len = 0;
			BYTE* msg_opt_buff = m_msg_opt->GetBytes(&msg_opt_buff_len);
			packet.WriteBytes(msg_opt_buff, msg_opt_buff_len);
		}
		U16 msg_rep_count = (U16)m_msg_rep.size();
		packet.WriteU16(msg_rep_count);
		for (list<MsgTestPhp*>::iterator i = m_msg_rep.begin(); i != m_msg_rep.end(); i++)
		{
			U32 msg_rep_buff_len = 0;
			MsgTestPhp* xx = (MsgTestPhp*)*i;
			BYTE* msg_rep_buff = xx->GetBytes(&msg_rep_buff_len);
			packet.WriteBytes(msg_rep_buff, msg_rep_buff_len);
		}
		packet.Encode(Msg::P_REQ_TEST_PHP);
		return packet;
	}


	void SetU64(U64 u64)
	{
		m_u64 = u64;
	}

	void SetStrxx(String strxx)
	{
		m_strxx = strxx;
	}

	void SetMsgReq(MsgTestPhp* msg_req)
	{
		m_msg_req = msg_req;
	}

	void SetMsgOpt(MsgTestPhp* msg_opt)
	{
		m_msg_opt_flag = 1;
		m_msg_opt = msg_opt;
	}

	void SetMsgRep(list<MsgTestPhp*> msg_rep)
	{
		m_msg_rep = msg_rep;
	}

};

#endif
