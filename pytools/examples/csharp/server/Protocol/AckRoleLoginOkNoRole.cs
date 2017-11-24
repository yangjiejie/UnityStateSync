using System.Collections;
using System.Collections.Generic;


public class AckRoleLoginOkNoRole
{


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.Encode(Msg.P_ACK_ROLE_LOGIN_OK_NO_ROLE);
		return packet;
	}



}
