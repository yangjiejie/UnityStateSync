#ifndef _ACK_SCENE_MOVE_
#define _ACK_SCENE_MOVE_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>

#include <MsgSceneRotPos.cpp>
#include <MsgSceneVector3.cpp>


class AckSceneMove
{
private:
	MsgSceneRotPos* m_scene_rot_pos;
	MsgSceneVector3* m_forward;
	String m_ani_name;
	I16 m_x_axis;
	U32 m_uid;


public:
	AckSceneMove(Packet* packet)
	{
		m_scene_rot_pos = new MsgSceneRotPos(packet);
		m_forward = new MsgSceneVector3(packet);
		m_ani_name = packet->ReadString();
		m_x_axis = packet->ReadI16();
		m_uid = packet->ReadU32();
	}


	MsgSceneRotPos* GetSceneRotPos()
	{
		return m_scene_rot_pos;
	}

	MsgSceneVector3* GetForward()
	{
		return m_forward;
	}

	String GetAniName()
	{
		return m_ani_name;
	}

	I16 GetXAxis()
	{
		return m_x_axis;
	}

	U32 GetUid()
	{
		return m_uid;
	}

};

#endif
