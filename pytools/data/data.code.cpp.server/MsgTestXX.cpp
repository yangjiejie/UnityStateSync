#ifndef _MSG_TEST_X_X_
#define _MSG_TEST_X_X_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class MsgTestXX
{
private:
	U8 m_id_u8;
	list<F32> m_id_f32;
	U8 m_id_op_u8_flag;
	U8 m_id_op_u8;


public:
	BYTE* Encode(U32* len)
	{
		Packet packet;
		packet.WriteU8(m_id_u8);
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
		return packet.ReadBytes(len);
	}

	MsgTestXX()
	{

	}

	MsgTestXX(Packet* packet)
	{
		m_id_u8 = packet->ReadU8();
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
	}

	BYTE* GetBytes(U32* len)
	{
		return Encode(len);
	}


	void SetIdU8(U8 id_u8)
	{
		m_id_u8 = id_u8;
	}
	U8 GetIdU8()
	{
		return m_id_u8;
	}

	void SetIdF32(list<F32> id_f32)
	{
		m_id_f32 = id_f32;
	}
	list<F32> GetIdF32()
	{
		return m_id_f32;
	}

	void SetIdOpU8(U8 id_op_u8)
	{
		m_id_op_u8_flag = 1;
		m_id_op_u8 = id_op_u8;
	}
	U8 GetIdOpU8()
	{
		return m_id_op_u8;
	}

};

#endif
