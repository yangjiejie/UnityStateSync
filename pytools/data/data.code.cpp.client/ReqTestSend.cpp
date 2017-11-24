#ifndef _REQ_TEST_SEND_
#define _REQ_TEST_SEND_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>

#include <MsgRoleBase.cpp>
#include <MsgRoleBase.cpp>


class ReqTestSend
{
private:
	U8 m_id_u8;
	MsgRoleBase* m_role_base;
	list<F32> m_id_f32;
	U8 m_id_op_u8_flag;
	U8 m_id_op_u8;
	U8 m_op_role_base_flag;
	MsgRoleBase* m_op_role_base;


public:
	Packet Encode()
	{
		Packet packet;
		packet.WriteU8(m_id_u8);
		U32 role_base_buff_len = 0;
		BYTE* role_base_buff = m_role_base->GetBytes(&role_base_buff_len);
		packet.WriteBytes(role_base_buff, role_base_buff_len);
		U16 id_f32_count = (U16)m_id_f32.size();
		packet.WriteU16(id_f32_count);
		for (list<F32>::iterator i = m_id_f32.begin(); i != m_id_f32.end(); i++)
		{
			packet.WriteF32((F32)*i);
		}
		packet.WriteU8(m_id_op_u8_flag);
		if (m_id_op_u8_flag == 1)
		{
			packet.WriteU8(m_id_op_u8);
		}
		packet.WriteU8(m_op_role_base_flag);
		if (m_op_role_base_flag == 1)
		{
			U32 op_role_base_buff_len = 0;
			BYTE* op_role_base_buff = m_op_role_base->GetBytes(&op_role_base_buff_len);
			packet.WriteBytes(op_role_base_buff, op_role_base_buff_len);
		}
		packet.Encode(Msg::P_REQ_TEST_SEND);
		return packet;
	}


	void SetIdU8(U8 id_u8)
	{
		m_id_u8 = id_u8;
	}

	void SetRoleBase(MsgRoleBase* role_base)
	{
		m_role_base = role_base;
	}

	void SetIdF32(list<F32> id_f32)
	{
		m_id_f32 = id_f32;
	}

	void SetIdOpU8(U8 id_op_u8)
	{
		m_id_op_u8_flag = 1;
		m_id_op_u8 = id_op_u8;
	}

	void SetOpRoleBase(MsgRoleBase* op_role_base)
	{
		m_op_role_base_flag = 1;
		m_op_role_base = op_role_base;
	}

};

#endif
