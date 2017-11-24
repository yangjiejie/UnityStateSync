package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class MsgScenePlayer
{
	private int uid;
	private MsgSceneRotPos scene_rot_pos;


	public MsgScenePlayer()
	{

	}

	public MsgScenePlayer(Packet packet)
	{
		uid = packet.readInt();
		scene_rot_pos = new MsgSceneRotPos(packet);
	}

	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeInt(uid);
		packet.writeBytes(scene_rot_pos.getBytes());
		return packet.readBytes();
	}

	public byte[] getBytes()
	{
		return this.encode();
	}



	public void setUid(int uid)
	{
		this.uid = uid;
	}
	public long getUid()
	{
		return PacketUtil.readUInt(this.uid);
	}

	public void setSceneRotPos(MsgSceneRotPos scene_rot_pos)
	{
		this.scene_rot_pos = scene_rot_pos;
	}
	public MsgSceneRotPos getSceneRotPos()
	{
		return this.scene_rot_pos;
	}

}
