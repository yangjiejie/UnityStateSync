package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class MsgSceneRotPos
{
	private short rot_x;
	private short rot_y;
	private short rot_z;
	private short pos_x;
	private short pos_y;
	private short pos_z;


	public MsgSceneRotPos()
	{

	}

	public MsgSceneRotPos(Packet packet)
	{
		rot_x = packet.readShort();
		rot_y = packet.readShort();
		rot_z = packet.readShort();
		pos_x = packet.readShort();
		pos_y = packet.readShort();
		pos_z = packet.readShort();
	}

	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeShort(rot_x);
		packet.writeShort(rot_y);
		packet.writeShort(rot_z);
		packet.writeShort(pos_x);
		packet.writeShort(pos_y);
		packet.writeShort(pos_z);
		return packet.readBytes();
	}

	public byte[] getBytes()
	{
		return this.encode();
	}



	public void setRotX(short rot_x)
	{
		this.rot_x = rot_x;
	}
	public short getRotX()
	{
		return this.rot_x;
	}

	public void setRotY(short rot_y)
	{
		this.rot_y = rot_y;
	}
	public short getRotY()
	{
		return this.rot_y;
	}

	public void setRotZ(short rot_z)
	{
		this.rot_z = rot_z;
	}
	public short getRotZ()
	{
		return this.rot_z;
	}

	public void setPosX(short pos_x)
	{
		this.pos_x = pos_x;
	}
	public short getPosX()
	{
		return this.pos_x;
	}

	public void setPosY(short pos_y)
	{
		this.pos_y = pos_y;
	}
	public short getPosY()
	{
		return this.pos_y;
	}

	public void setPosZ(short pos_z)
	{
		this.pos_z = pos_z;
	}
	public short getPosZ()
	{
		return this.pos_z;
	}

}
