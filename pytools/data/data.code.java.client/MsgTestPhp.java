package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class MsgTestPhp
{
	private short u16;


	public MsgTestPhp()
	{

	}

	public MsgTestPhp(Packet packet)
	{
		u16 = packet.readShort();
	}

	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeShort(u16);
		return packet.readBytes();
	}

	public byte[] getBytes()
	{
		return this.encode();
	}



	public void setU16(short u16)
	{
		this.u16 = u16;
	}
	public int getU16()
	{
		return PacketUtil.readUShort(this.u16);
	}

}
