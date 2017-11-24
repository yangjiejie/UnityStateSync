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


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeInt(uid);
		packet.writeInt(uuid);
		packet.writeShort(sid);
		packet.writeShort(cid);
		packet.writeInt(login_time);
		packet.writeString(pwd);
		packet.writeByte(relink);
		packet.writeByte(debug);
		packet.writeString(os);
		packet.writeString(version);
		return packet.encode((short)Msg.P_REQ_ROLE_LOGIN);
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

	public void setLoginTime(int login_time)
	{
		this.login_time = login_time;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	public void setRelink(byte relink)
	{
		this.relink = relink;
	}

	public void setDebug(byte debug)
	{
		this.debug = debug;
	}

	public void setOs(String os)
	{
		this.os = os;
	}

	public void setVersion(String version)
	{
		this.version = version;
	}

}
