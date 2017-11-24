#ifndef _MSG_TEST_PHP_
#define _MSG_TEST_PHP_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class MsgTestPhp
{
private:
	U16 m_u16;


public:
	BYTE* Encode(U32* len)
	{
		Packet packet;
		packet.WriteU16(m_u16);
		return packet.ReadBytes(len);
	}

	MsgTestPhp()
	{

	}

	MsgTestPhp(Packet* packet)
	{
		m_u16 = packet->ReadU16();
	}

	BYTE* GetBytes(U32* len)
	{
		return Encode(len);
	}


	void SetU16(U16 u16)
	{
		m_u16 = u16;
	}
	U16 GetU16()
	{
		return m_u16;
	}

};

#endif
