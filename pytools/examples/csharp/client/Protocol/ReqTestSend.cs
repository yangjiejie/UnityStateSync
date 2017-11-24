using System.Collections;
using System.Collections.Generic;


public class ReqTestSend
{
	private byte _id_u8;
	private MsgRoleBase _role_base;
	private List<float> _id_f32 = new List<float>();
	private byte id_op_u8_flag;
	private byte _id_op_u8;
	private byte op_role_base_flag;
	private MsgRoleBase _op_role_base;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteByte(this._id_u8);
		packet.WriteBuffer(this._role_base.GetBuffer());
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
		packet.WriteByte(op_role_base_flag);
		if (this.op_role_base_flag == 1)
		{
			packet.WriteBuffer(this._op_role_base.GetBuffer());
		}
		packet.Encode(Msg.P_REQ_TEST_SEND);
		return packet;
	}


	public byte id_u8
	{
		get { return this._id_u8; }
		set { this._id_u8 = value; }
	}

	public MsgRoleBase role_base
	{
		get { return this._role_base; }
		set { this._role_base = value; }
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

	public MsgRoleBase op_role_base
	{
		get { return this._op_role_base; }
		set { this.op_role_base_flag = 1; this._op_role_base = value; }
	}

}
