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


	public ReqRoleLogin(Packet packet)
	{
		this._uid = packet.ReadUint();
		this._uuid = packet.ReadUint();
		this._sid = packet.ReadUshort();
		this._cid = packet.ReadUshort();
		this._login_time = packet.ReadUint();
		this._pwd = packet.ReadString();
		this._relink = packet.ReadByte();
		this._debug = packet.ReadByte();
		this._os = packet.ReadString();
		this._version = packet.ReadString();
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
