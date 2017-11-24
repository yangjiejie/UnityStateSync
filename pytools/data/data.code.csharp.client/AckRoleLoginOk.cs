using System.Collections;
using System.Collections.Generic;


public class AckRoleLoginOk
{
	private string _uname;


	public AckRoleLoginOk(Packet packet)
	{
		this._uname = packet.ReadString();
	}


	public string uname
	{
		get { return this._uname; }
		set { this._uname = value; }
	}

}
