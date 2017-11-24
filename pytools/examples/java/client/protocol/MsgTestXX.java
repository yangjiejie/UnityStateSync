package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class MsgTestXX
{
	private byte id_u8;
	private List<Float> id_f32 = new ArrayList<Float>();
	private byte id_op_u8_flag;
	private byte id_op_u8;


	public MsgTestXX()
	{

	}

	public MsgTestXX(Packet packet)
	{
		id_u8 = packet.readByte();
		int id_f32_count = PacketUtil.readUShort(packet.readShort());
		for (int i = 0; i < id_f32_count; i++)
		{
			id_f32.add(packet.readFloat());
		}
		id_op_u8_flag = packet.readByte();
		if (id_op_u8_flag == 1)
		{
			id_op_u8 = packet.readByte();
		}
	}

	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeByte(id_u8);
		int id_f32_count = id_f32.size();
		packet.writeShort((short)id_f32_count);
		for (int i = 0; i < id_f32_count; i++)
		{
			packet.writeFloat((float)id_f32.get(i));
		}
		packet.writeByte(id_op_u8_flag);
		if (id_op_u8_flag == 1)
		{
			packet.writeByte(id_op_u8);
		}
		return packet.readBytes();
	}

	public byte[] getBytes()
	{
		return this.encode();
	}



	public void setIdU8(byte id_u8)
	{
		this.id_u8 = id_u8;
	}
	public int getIdU8()
	{
		return PacketUtil.readUByte(this.id_u8);
	}

	public void setIdF32(List<Float> id_f32)
	{
		this.id_f32 = id_f32;
	}
	public List<Float> getIdF32()
	{
		return this.id_f32;
	}

	public void setIdOpU8(byte id_op_u8)
	{
		this.id_op_u8_flag = (byte)1;
		this.id_op_u8 = id_op_u8;
	}
	public int getIdOpU8()
	{
		return PacketUtil.readUByte(this.id_op_u8);
	}

}
