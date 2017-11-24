#ifndef _MSG_SCENE_PLAYER_
#define _MSG_SCENE_PLAYER_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>

#include <MsgSceneRotPos.cpp>


class MsgScenePlayer
{
private:
	U32 m_uid;
	MsgSceneRotPos* m_scene_rot_pos;


public:
	BYTE* Encode(U32* len)
	{
		Packet packet;
		packet.WriteU32(m_uid);
		U32 scene_rot_pos_buff_len = 0;
		BYTE* scene_rot_pos_buff = m_scene_rot_pos->GetBytes(&scene_rot_pos_buff_len);
		packet.WriteBytes(scene_rot_pos_buff, scene_rot_pos_buff_len);
		return packet.ReadBytes(len);
	}

	MsgScenePlayer()
	{

	}

	MsgScenePlayer(Packet* packet)
	{
		m_uid = packet->ReadU32();
		m_scene_rot_pos = new MsgSceneRotPos(packet);
	}

	BYTE* GetBytes(U32* len)
	{
		return Encode(len);
	}


	void SetUid(U32 uid)
	{
		m_uid = uid;
	}
	U32 GetUid()
	{
		return m_uid;
	}

	void SetSceneRotPos(MsgSceneRotPos* scene_rot_pos)
	{
		m_scene_rot_pos = scene_rot_pos;
	}
	MsgSceneRotPos* GetSceneRotPos()
	{
		return m_scene_rot_pos;
	}

};

#endif
