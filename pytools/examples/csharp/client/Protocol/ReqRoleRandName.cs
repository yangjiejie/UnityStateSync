using System.Collections;
using System.Collections.Generic;


public class ReqRoleRandName
{


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.Encode(Msg.P_REQ_ROLE_RAND_NAME);
		return packet;
	}



}
