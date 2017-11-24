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


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeByte(id_u8);
		packet.writeShort(id_u16);
		packet.writeInt(id_u32);
		int repeat_id_u8_count = repeat_id_u8.size();
		packet.writeShort((short)repeat_id_u8_count);
		for (int i = 0; i < repeat_id_u8_count; i++)
		{
			packet.writeByte((byte)repeat_id_u8.get(i));
		}
		packet.writeByte(optional_id_u8_flag);
		if (optional_id_u8_flag == 1)
		{
			packet.writeByte(optional_id_u8);
		}
		return packet.encode((short)Msg.P_ACK_TEST_X_X);
	}



	public void setIdU8(byte id_u8)
	{
		this.id_u8 = id_u8;
	}

	public void setIdU16(short id_u16)
	{
		this.id_u16 = id_u16;
	}

	public void setIdU32(int id_u32)
	{
		this.id_u32 = id_u32;
	}

	public void setRepeatIdU8(List<Byte> repeat_id_u8)
	{
		this.repeat_id_u8 = repeat_id_u8;
	}

	public void setOptionalIdU8(byte optional_id_u8)
	{
		this.optional_id_u8_flag = (byte)1;
		this.optional_id_u8 = optional_id_u8;
	}

}
