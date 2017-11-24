#ifndef _ACK_TEST_X_X_
#define _ACK_TEST_X_X_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class AckTestXX
{
private:
	U8 m_id_u8;
	U16 m_id_u16;
	U32 m_id_u32;
	list<U8> m_repeat_id_u8;
	U8 m_optional_id_u8_flag;
	U8 m_optional_id_u8;


public:
	Packet Encode()
	{
		Packet packet;
		packet.WriteU8(m_id_u8);
		packet.WriteU16(m_id_u16);
		packet.WriteU32(m_id_u32);
		U16 repeat_id_u8_count = (U16)m_repeat_id_u8.size();
		packet.WriteU16(repeat_id_u8_count);
		for (list<U8>::iterator i = m_repeat_id_u8.begin(); i != m_repeat_id_u8.end(); i++)
		{
			packet.WriteU8((U8)*i);
		}
		packet.WriteU8(m_optional_id_u8_flag);
		if (m_optional_id_u8_flag == 1)
		{
			packet.WriteU8(m_optional_id_u8);
		}
		packet.Encode(Msg::P_ACK_TEST_X_X);
		return packet;
	}


	void SetIdU8(U8 id_u8)
	{
		m_id_u8 = id_u8;
	}

	void SetIdU16(U16 id_u16)
	{
		m_id_u16 = id_u16;
	}

	void SetIdU32(U32 id_u32)
	{
		m_id_u32 = id_u32;
	}

	void SetRepeatIdU8(list<U8> repeat_id_u8)
	{
		m_repeat_id_u8 = repeat_id_u8;
	}

	void SetOptionalIdU8(U8 optional_id_u8)
	{
		m_optional_id_u8_flag = 1;
		m_optional_id_u8 = optional_id_u8;
	}

};

#endif
