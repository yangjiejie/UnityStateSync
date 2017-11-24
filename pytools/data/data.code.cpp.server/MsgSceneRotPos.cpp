#ifndef _MSG_SCENE_ROT_POS_
#define _MSG_SCENE_ROT_POS_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>



class MsgSceneRotPos
{
private:
	I16 m_rot_x;
	I16 m_rot_y;
	I16 m_rot_z;
	I16 m_pos_x;
	I16 m_pos_y;
	I16 m_pos_z;


public:
	BYTE* Encode(U32* len)
	{
		Packet packet;
		packet.WriteI16(m_rot_x);
		packet.WriteI16(m_rot_y);
		packet.WriteI16(m_rot_z);
		packet.WriteI16(m_pos_x);
		packet.WriteI16(m_pos_y);
		packet.WriteI16(m_pos_z);
		return packet.ReadBytes(len);
	}

	MsgSceneRotPos()
	{

	}

	MsgSceneRotPos(Packet* packet)
	{
		m_rot_x = packet->ReadI16();
		m_rot_y = packet->ReadI16();
		m_rot_z = packet->ReadI16();
		m_pos_x = packet->ReadI16();
		m_pos_y = packet->ReadI16();
		m_pos_z = packet->ReadI16();
	}

	BYTE* GetBytes(U32* len)
	{
		return Encode(len);
	}


	void SetRotX(I16 rot_x)
	{
		m_rot_x = rot_x;
	}
	I16 GetRotX()
	{
		return m_rot_x;
	}

	void SetRotY(I16 rot_y)
	{
		m_rot_y = rot_y;
	}
	I16 GetRotY()
	{
		return m_rot_y;
	}

	void SetRotZ(I16 rot_z)
	{
		m_rot_z = rot_z;
	}
	I16 GetRotZ()
	{
		return m_rot_z;
	}

	void SetPosX(I16 pos_x)
	{
		m_pos_x = pos_x;
	}
	I16 GetPosX()
	{
		return m_pos_x;
	}

	void SetPosY(I16 pos_y)
	{
		m_pos_y = pos_y;
	}
	I16 GetPosY()
	{
		return m_pos_y;
	}

	void SetPosZ(I16 pos_z)
	{
		m_pos_z = pos_z;
	}
	I16 GetPosZ()
	{
		return m_pos_z;
	}

};

#endif
