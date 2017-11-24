package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckSceneMove
{
	private MsgSceneRotPos scene_rot_pos;
	private MsgSceneVector3 forward;
	private String ani_name;
	private short x_axis;
	private int uid;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeBytes(scene_rot_pos.getBytes());
		packet.writeBytes(forward.getBytes());
		packet.writeString(ani_name);
		packet.writeShort(x_axis);
		packet.writeInt(uid);
		return packet.encode((short)Msg.P_ACK_SCENE_MOVE);
	}



	public void setSceneRotPos(MsgSceneRotPos scene_rot_pos)
	{
		this.scene_rot_pos = scene_rot_pos;
	}

	public void setForward(MsgSceneVector3 forward)
	{
		this.forward = forward;
	}

	public void setAniName(String ani_name)
	{
		this.ani_name = ani_name;
	}

	public void setXAxis(short x_axis)
	{
		this.x_axis = x_axis;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

}
