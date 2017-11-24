using System.Collections;
using System.Collections.Generic;


public class MsgTestXX
{
	private byte _id_u8;
	private List<float> _id_f32 = new List<float>();
	private byte id_op_u8_flag;
	private byte _id_op_u8;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteByte(this._id_u8);
		ushort id_f32_count = (ushort)this._id_f32.Count;
		packet.WriteUshort(id_f32_count);
		for (ushort i = 0; i < id_f32_count; i++)
		{
			float xxx = this._id_f32[i];
			packet.WriteFloat(xxx);
		}
		packet.WriteByte(id_op_u8_flag);
		if (this.id_op_u8_flag == 1)
		{
			packet.WriteByte(this._id_op_u8);
		}
		return packet;
	}

	public MsgTestXX()
	{
	}

	public MsgTestXX(Packet packet)
	{
		this._id_u8 = packet.ReadByte();
		this._id_f32 = new List<float>();
		ushort id_f32_count = packet.ReadUshort();
		for (ushort i = 0; i < id_f32_count; i++)
		{
			this._id_f32.Add(packet.ReadFloat());
		}
		this. id_op_u8_flag = packet.ReadByte();
		if (this.id_op_u8_flag == 1)
		{
			this._id_op_u8 = packet.ReadByte();
		}
	}

	public List<byte> GetBuffer()
	{
		return this.Encode().GetBuffer();
	}


	public byte id_u8
	{
		get { return this._id_u8; }
		set { this._id_u8 = value; }
	}

	public List<float> id_f32
	{
		get { return this._id_f32; }
		set { this._id_f32 = value; }
	}

	public byte id_op_u8
	{
		get { return this._id_op_u8; }
		set { this.id_op_u8_flag = 1; this._id_op_u8 = value; }
	}

}
