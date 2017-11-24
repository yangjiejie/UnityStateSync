package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class MsgSceneVector3
{
	private short x;
	private short y;
	private short z;


	public MsgSceneVector3()
	{

	}

	public MsgSceneVector3(Packet packet)
	{
		x = packet.readShort();
		y = packet.readShort();
		z = packet.readShort();
	}

	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeShort(x);
		packet.writeShort(y);
		packet.writeShort(z);
		return packet.readBytes();
	}

	public byte[] getBytes()
	{
		return this.encode();
	}



	public void setX(short x)
	{
		this.x = x;
	}
	public short getX()
	{
		return this.x;
	}

	public void setY(short y)
	{
		this.y = y;
	}
	public short getY()
	{
		return this.y;
	}

	public void setZ(short z)
	{
		this.z = z;
	}
	public short getZ()
	{
		return this.z;
	}

}
