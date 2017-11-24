#ifndef _ACK_TEST_SEND_OK_
#define _ACK_TEST_SEND_OK_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>

#include <MsgRoleBase.cpp>
#include <MsgRoleBase.cpp>


class AckTestSendOk
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
	AckTestSendOk(Packet* packet)
	{
		m_id_u8 = packet->ReadU8();
		m_role_base = new MsgRoleBase(packet);
		U16 id_f32_count = packet->ReadU16();
		for (U16 i = 0; i < id_f32_count; i++)
		{
			m_id_f32.push_back(packet->ReadF32());
		}
		m_id_op_u8_flag = packet->ReadU8();
		if (m_id_op_u8_flag == 1)
		{
			m_id_op_u8 = packet->ReadU8();
		}
		m_op_role_base_flag = packet->ReadU8();
		if (m_op_role_base_flag == 1)
		{
			m_op_role_base = new MsgRoleBase(packet);
		}
	}


	U8 GetIdU8()
	{
		return m_id_u8;
	}

	MsgRoleBase* GetRoleBase()
	{
		return m_role_base;
	}

	list<F32> GetIdF32()
	{
		return m_id_f32;
	}

	U8 GetIdOpU8()
	{
		return m_id_op_u8;
	}

	MsgRoleBase* GetOpRoleBase()
	{
		return m_op_role_base;
	}

};

#endif
