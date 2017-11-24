package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqTestSend
{
	private byte id_u8;
	private MsgRoleBase role_base;
	private List<Float> id_f32 = new ArrayList<Float>();
	private byte id_op_u8_flag;
	private byte id_op_u8;
	private byte op_role_base_flag;
	private MsgRoleBase op_role_base;


	public ReqTestSend(Packet packet)
	{
		id_u8 = packet.readByte();
		role_base = new MsgRoleBase(packet);
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
		op_role_base_flag = packet.readByte();
		if (op_role_base_flag == 1)
		{
			op_role_base = new MsgRoleBase(packet);
		}
	}



	public int getIdU8()
	{
		return PacketUtil.readUByte(this.id_u8);
	}

	public MsgRoleBase getRoleBase()
	{
		return this.role_base;
	}

	public List<Float> getIdF32()
	{
		return this.id_f32;
	}

	public int getIdOpU8()
	{
		return PacketUtil.readUByte(this.id_op_u8);
	}

	public MsgRoleBase getOpRoleBase()
	{
		return this.op_role_base;
	}

}
