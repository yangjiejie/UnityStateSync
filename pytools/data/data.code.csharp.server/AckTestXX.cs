using System.Collections;
using System.Collections.Generic;


public class AckTestXX
{
	private byte _id_u8;
	private ushort _id_u16;
	private uint _id_u32;
	private List<byte> _repeat_id_u8 = new List<byte>();
	private byte optional_id_u8_flag;
	private byte _optional_id_u8;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteByte(this._id_u8);
		packet.WriteUshort(this._id_u16);
		packet.WriteUint(this._id_u32);
		ushort repeat_id_u8_count = (ushort)this._repeat_id_u8.Count;
		packet.WriteUshort(repeat_id_u8_count);
		for (ushort i = 0; i < repeat_id_u8_count; i++)
		{
			byte xxx = this._repeat_id_u8[i];
			packet.WriteByte(xxx);
		}
		packet.WriteByte(optional_id_u8_flag);
		if (this.optional_id_u8_flag == 1)
		{
			packet.WriteByte(this._optional_id_u8);
		}
		packet.Encode(Msg.P_ACK_TEST_X_X);
		return packet;
	}


	public byte id_u8
	{
		get { return this._id_u8; }
		set { this._id_u8 = value; }
	}

	public ushort id_u16
	{
		get { return this._id_u16; }
		set { this._id_u16 = value; }
	}

	public uint id_u32
	{
		get { return this._id_u32; }
		set { this._id_u32 = value; }
	}

	public List<byte> repeat_id_u8
	{
		get { return this._repeat_id_u8; }
		set { this._repeat_id_u8 = value; }
	}

	public byte optional_id_u8
	{
		get { return this._optional_id_u8; }
		set { this.optional_id_u8_flag = 1; this._optional_id_u8 = value; }
	}

}
