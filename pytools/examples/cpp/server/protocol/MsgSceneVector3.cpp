#ifndef _MSG_SCENE_VECTOR_3_
#define _MSG_SCENE_VECTOR_3_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class MsgSceneVector3
{
private:
	I16 m_x;
	I16 m_y;
	I16 m_z;


public:
	BYTE* Encode(U32* len)
	{
		Packet packet;
		packet.WriteI16(m_x);
		packet.WriteI16(m_y);
		packet.WriteI16(m_z);
		return packet.ReadBytes(len);
	}

	MsgSceneVector3()
	{

	}

	MsgSceneVector3(Packet* packet)
	{
		m_x = packet->ReadI16();
		m_y = packet->ReadI16();
		m_z = packet->ReadI16();
	}

	BYTE* GetBytes(U32* len)
	{
		return Encode(len);
	}


	void SetX(I16 x)
	{
		m_x = x;
	}
	I16 GetX()
	{
		return m_x;
	}

	void SetY(I16 y)
	{
		m_y = y;
	}
	I16 GetY()
	{
		return m_y;
	}

	void SetZ(I16 z)
	{
		m_z = z;
	}
	I16 GetZ()
	{
		return m_z;
	}

};

#endif
