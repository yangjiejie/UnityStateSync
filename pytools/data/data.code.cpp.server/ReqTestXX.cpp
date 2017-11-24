#ifndef _REQ_TEST_X_X_
#define _REQ_TEST_X_X_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class ReqTestXX
{
private:
	U8 m_id_u8;
	U16 m_id_u16;
	U32 m_id_u32;
	list<U8> m_repeat_id_u8;
	U8 m_optional_id_u8_flag;
	U8 m_optional_id_u8;


public:
	ReqTestXX(Packet* packet)
	{
		m_id_u8 = packet->ReadU8();
		m_id_u16 = packet->ReadU16();
		m_id_u32 = packet->ReadU32();
		U16 repeat_id_u8_count = packet->ReadU16();
		for (U16 i = 0; i < repeat_id_u8_count; i++)
		{
			m_repeat_id_u8.push_back(packet->ReadU8());
		}
		m_optional_id_u8_flag = packet->ReadU8();
		if (m_optional_id_u8_flag == 1)
		{
			m_optional_id_u8 = packet->ReadU8();
		}
	}


	U8 GetIdU8()
	{
		return m_id_u8;
	}

	U16 GetIdU16()
	{
		return m_id_u16;
	}

	U32 GetIdU32()
	{
		return m_id_u32;
	}

	list<U8> GetRepeatIdU8()
	{
		return m_repeat_id_u8;
	}

	U8 GetOptionalIdU8()
	{
		return m_optional_id_u8;
	}

};

#endif
