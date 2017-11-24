using System.Collections;
using System.Collections.Generic;


public class ReqRoleCreate
{
	private uint _uid;
	private uint _uuid;
	private ushort _sid;
	private ushort _cid;
	private string _os;
	private string _version;
	private string _uname;
	private string _source;
	private string _source_sub;
	private uint _login_time;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUint(this._uid);
		packet.WriteUint(this._uuid);
		packet.WriteUshort(this._sid);
		packet.WriteUshort(this._cid);
		packet.WriteString(this._os);
		packet.WriteString(this._version);
		packet.WriteString(this._uname);
		packet.WriteString(this._source);
		packet.WriteString(this._source_sub);
		packet.WriteUint(this._login_time);
		packet.Encode(Msg.P_REQ_ROLE_CREATE);
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

	public string uname
	{
		get { return this._uname; }
		set { this._uname = value; }
	}

	public string source
	{
		get { return this._source; }
		set { this._source = value; }
	}

	public string source_sub
	{
		get { return this._source_sub; }
		set { this._source_sub = value; }
	}

	public uint login_time
	{
		get { return this._login_time; }
		set { this._login_time = value; }
	}

}
