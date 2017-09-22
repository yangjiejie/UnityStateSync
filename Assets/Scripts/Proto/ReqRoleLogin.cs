using System.Collections;
using System.Collections.Generic;


public class ReqRoleLogin
{
	private string _uname;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteString(this._uname);
		packet.Encode(Msg.P_REQ_ROLE_LOGIN);
		return packet;
	}


	public string uname
	{
		get { return this._uname; }
		set { this._uname = value; }
	}

}
