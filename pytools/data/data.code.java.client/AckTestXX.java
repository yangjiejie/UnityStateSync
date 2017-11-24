package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckTestXX
{
	private byte id_u8;
	private short id_u16;
	private int id_u32;
	private List<Byte> repeat_id_u8 = new ArrayList<Byte>();
	private byte optional_id_u8_flag;
	private byte optional_id_u8;


	public AckTestXX(Packet packet)
	{
		id_u8 = packet.readByte();
		id_u16 = packet.readShort();
		id_u32 = packet.readInt();
		int repeat_id_u8_count = PacketUtil.readUShort(packet.readShort());
		for (int i = 0; i < repeat_id_u8_count; i++)
		{
			repeat_id_u8.add(packet.readByte());
		}
		optional_id_u8_flag = packet.readByte();
		if (optional_id_u8_flag == 1)
		{
			optional_id_u8 = packet.readByte();
		}
	}



	public int getIdU8()
	{
		return PacketUtil.readUByte(this.id_u8);
	}

	public int getIdU16()
	{
		return PacketUtil.readUShort(this.id_u16);
	}

	public long getIdU32()
	{
		return PacketUtil.readUInt(this.id_u32);
	}

	public List<Byte> getRepeatIdU8()
	{
		return this.repeat_id_u8;
	}

	public int getOptionalIdU8()
	{
		return PacketUtil.readUByte(this.optional_id_u8);
	}

}
