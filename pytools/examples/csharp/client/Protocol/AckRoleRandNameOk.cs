using System.Collections;
using System.Collections.Generic;


public class AckRoleRandNameOk
{
	private string _uname;


	public AckRoleRandNameOk(Packet packet)
	{
		this._uname = packet.ReadString();
	}


	public string uname
	{
		get { return this._uname; }
		set { this._uname = value; }
	}

}
