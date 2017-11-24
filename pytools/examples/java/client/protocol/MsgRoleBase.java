package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class MsgRoleBase
{
	private int uid;
	private String uname;


	public MsgRoleBase()
	{

	}

	public MsgRoleBase(Packet packet)
	{
		uid = packet.readInt();
		uname = packet.readString();
	}

	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeInt(uid);
		packet.writeString(uname);
		return packet.readBytes();
	}

	public byte[] getBytes()
	{
		return this.encode();
	}



	public void setUid(int uid)
	{
		this.uid = uid;
	}
	public long getUid()
	{
		return PacketUtil.readUInt(this.uid);
	}

	public void setUname(String uname)
	{
		this.uname = uname;
	}
	public String getUname()
	{
		return this.uname;
	}

}
