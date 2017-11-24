package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqRoleCreate
{
	private int uid;
	private int uuid;
	private short sid;
	private short cid;
	private String os;
	private String version;
	private String uname;
	private String source;
	private String source_sub;
	private int login_time;


	public ReqRoleCreate(Packet packet)
	{
		uid = packet.readInt();
		uuid = packet.readInt();
		sid = packet.readShort();
		cid = packet.readShort();
		os = packet.readString();
		version = packet.readString();
		uname = packet.readString();
		source = packet.readString();
		source_sub = packet.readString();
		login_time = packet.readInt();
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

	public String getOs()
	{
		return this.os;
	}

	public String getVersion()
	{
		return this.version;
	}

	public String getUname()
	{
		return this.uname;
	}

	public String getSource()
	{
		return this.source;
	}

	public String getSourceSub()
	{
		return this.source_sub;
	}

	public long getLoginTime()
	{
		return PacketUtil.readUInt(this.login_time);
	}

}
