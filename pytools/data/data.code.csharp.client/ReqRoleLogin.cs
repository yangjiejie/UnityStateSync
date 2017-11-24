using System.Collections;
using System.Collections.Generic;


public class ReqRoleLogin
{
	private uint _uid;
	private uint _uuid;
	private ushort _sid;
	private ushort _cid;
	private uint _login_time;
	private string _pwd;
	private byte _relink;
	private byte _debug;
	private string _os;
	private string _version;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUint(this._uid);
		packet.WriteUint(this._uuid);
		packet.WriteUshort(this._sid);
		packet.WriteUshort(this._cid);
		packet.WriteUint(this._login_time);
		packet.WriteString(this._pwd);
		packet.WriteByte(this._relink);
		packet.WriteByte(this._debug);
		packet.WriteString(this._os);
		packet.WriteString(this._version);
		packet.Encode(Msg.P_REQ_ROLE_LOGIN);
		return packet;
	}


	public uint uid
	{
		get { return this._uid; }
		set { this._uid = value; }
	}

	public uint uuid
	{
		get { return this._uuid; }
		set { this._uuid = value; }
	}

	public ushort sid
	{
		get { return this._sid; }
		set { this._sid = value; }
	}

	public ushort cid
	{
		get { return this._cid; }
		set { this._cid = value; }
	}

	public uint login_time
	{
		get { return this._login_time; }
		set { this._login_time = value; }
	}

	public string pwd
	{
		get { return this._pwd; }
		set { this._pwd = value; }
	}

	public byte relink
	{
		get { return this._relink; }
		set { this._relink = value; }
	}

	public byte debug
	{
		get { return this._debug; }
		set { this._debug = value; }
	}

	public string os
	{
		get { return this._os; }
		set { this._os = value; }
	}

	public string version
	{
		get { return this._version; }
		set { this._version = value; }
	}

}
