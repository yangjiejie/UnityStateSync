package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqRoleLogin
{
	private int uid;
	private int uuid;
	private short sid;
	private short cid;
	private int login_time;
	private String pwd;
	private byte relink;
	private byte debug;
	private String os;
	private String version;


	public ReqRoleLogin(Packet packet)
	{
		uid = packet.readInt();
		uuid = packet.readInt();
		sid = packet.readShort();
		cid = packet.readShort();
		login_time = packet.readInt();
		pwd = packet.readString();
		relink = packet.readByte();
		debug = packet.readByte();
		os = packet.readString();
		version = packet.readString();
	}



	public long getUid()
	{
		return PacketUtil.readUInt(this.uid);
	}

	public long getUuid()
	{
		return PacketUtil.readUInt(this.uuid);
	}

	public int getSid()
	{
		return PacketUtil.readUShort(this.sid);
	}

	public int getCid()
	{
		return PacketUtil.readUShort(this.cid);
	}

	public long getLoginTime()
	{
		return PacketUtil.readUInt(this.login_time);
	}

	public String getPwd()
	{
		return this.pwd;
	}

	public int getRelink()
	{
		return PacketUtil.readUByte(this.relink);
	}

	public int getDebug()
	{
		return PacketUtil.readUByte(this.debug);
	}

	public String getOs()
	{
		return this.os;
	}

	public String getVersion()
	{
		return this.version;
	}

}
