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


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeInt(uid);
		packet.writeInt(uuid);
		packet.writeShort(sid);
		packet.writeShort(cid);
		packet.writeString(os);
		packet.writeString(version);
		packet.writeString(uname);
		packet.writeString(source);
		packet.writeString(source_sub);
		packet.writeInt(login_time);
		return packet.encode((short)Msg.P_REQ_ROLE_CREATE);
	}



	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public void setUuid(int uuid)
	{
		this.uuid = uuid;
	}

	public void setSid(short sid)
	{
		this.sid = sid;
	}

	public void setCid(short cid)
	{
		this.cid = cid;
	}

	public void setOs(String os)
	{
		this.os = os;
	}

	public void setVersion(String version)
	{
		this.version = version;
	}

	public void setUname(String uname)
	{
		this.uname = uname;
	}

	public void setSource(String source)
	{
		this.source = source;
	}

	public void setSourceSub(String source_sub)
	{
		this.source_sub = source_sub;
	}

	public void setLoginTime(int login_time)
	{
		this.login_time = login_time;
	}

}
