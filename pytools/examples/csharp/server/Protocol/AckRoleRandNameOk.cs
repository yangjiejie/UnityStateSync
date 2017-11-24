using System.Collections;
using System.Collections.Generic;


public class AckRoleRandNameOk
{
	private string _uname;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteString(this._uname);
		packet.Encode(Msg.P_ACK_ROLE_RAND_NAME_OK);
		return packet;
	}


	public string uname
	{
		get { return this._uname; }
		set { this._uname = value; }
	}

}
