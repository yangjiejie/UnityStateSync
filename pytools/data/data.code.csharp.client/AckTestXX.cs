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


	public AckTestXX(Packet packet)
	{
		this._id_u8 = packet.ReadByte();
		this._id_u16 = packet.ReadUshort();
		this._id_u32 = packet.ReadUint();
		this._repeat_id_u8 = new List<byte>();
		ushort repeat_id_u8_count = packet.ReadUshort();
		for (ushort i = 0; i < repeat_id_u8_count; i++)
		{
			this._repeat_id_u8.Add(packet.ReadByte());
		}
		this. optional_id_u8_flag = packet.ReadByte();
		if (this.optional_id_u8_flag == 1)
		{
			this._optional_id_u8 = packet.ReadByte();
		}
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
