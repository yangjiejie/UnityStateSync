package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class MsgTestSend
{
	private byte id_u8;
	private MsgRoleBase role_base;
	private List<Float> id_f32 = new ArrayList<Float>();
	private byte id_op_u8_flag;
	private byte id_op_u8;
	private byte op_role_base_flag;
	private MsgRoleBase op_role_base;


	public MsgTestSend()
	{

	}

	public MsgTestSend(Packet packet)
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

	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeByte(id_u8);
		packet.writeBytes(role_base.getBytes());
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
		packet.writeByte(op_role_base_flag);
		if (op_role_base_flag == 1)
		{
			packet.writeBytes(op_role_base.getBytes());
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

	public void setRoleBase(MsgRoleBase role_base)
	{
		this.role_base = role_base;
	}
	public MsgRoleBase getRoleBase()
	{
		return this.role_base;
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

	public void setOpRoleBase(MsgRoleBase op_role_base)
	{
		this.op_role_base_flag = (byte)1;
		this.op_role_base = op_role_base;
	}
	public MsgRoleBase getOpRoleBase()
	{
		return this.op_role_base;
	}

}
