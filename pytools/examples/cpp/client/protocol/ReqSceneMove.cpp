#ifndef _REQ_SCENE_MOVE_
#define _REQ_SCENE_MOVE_

#include <list>

#include <pb_type.hpp>
#include <Packet.hpp>

#include <Msg.hpp>

#include <MsgSceneRotPos.cpp>
#include <MsgSceneVector3.cpp>


class ReqSceneMove
{
private:
	MsgSceneRotPos* m_scene_rot_pos;
	MsgSceneVector3* m_forward;
	String m_ani_name;
	I16 m_x_axis;


public:
	Packet Encode()
	{
		Packet packet;
		U32 scene_rot_pos_buff_len = 0;
		BYTE* scene_rot_pos_buff = m_scene_rot_pos->GetBytes(&scene_rot_pos_buff_len);
		packet.WriteBytes(scene_rot_pos_buff, scene_rot_pos_buff_len);
		U32 forward_buff_len = 0;
		BYTE* forward_buff = m_forward->GetBytes(&forward_buff_len);
		packet.WriteBytes(forward_buff, forward_buff_len);
		packet.WriteString(m_ani_name);
		packet.WriteI16(m_x_axis);
		packet.Encode(Msg::P_REQ_SCENE_MOVE);
		return packet;
	}


	void SetSceneRotPos(MsgSceneRotPos* scene_rot_pos)
	{
		m_scene_rot_pos = scene_rot_pos;
	}

	void SetForward(MsgSceneVector3* forward)
	{
		m_forward = forward;
	}

	void SetAniName(String ani_name)
	{
		m_ani_name = ani_name;
	}

	void SetXAxis(I16 x_axis)
	{
		m_x_axis = x_axis;
	}

};

#endif
