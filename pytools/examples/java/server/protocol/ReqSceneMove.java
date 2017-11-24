package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqSceneMove
{
	private MsgSceneRotPos scene_rot_pos;
	private MsgSceneVector3 forward;
	private String ani_name;
	private short x_axis;


	public ReqSceneMove(Packet packet)
	{
		scene_rot_pos = new MsgSceneRotPos(packet);
		forward = new MsgSceneVector3(packet);
		ani_name = packet.readString();
		x_axis = packet.readShort();
	}



	public MsgSceneRotPos getSceneRotPos()
	{
		return this.scene_rot_pos;
	}

	public MsgSceneVector3 getForward()
	{
		return this.forward;
	}

	public String getAniName()
	{
		return this.ani_name;
	}

	public short getXAxis()
	{
		return this.x_axis;
	}

}
