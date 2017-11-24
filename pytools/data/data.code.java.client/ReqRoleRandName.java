package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqRoleRandName
{


	public byte[] encode()
	{
		Packet packet = new Packet();
		return packet.encode((short)Msg.P_REQ_ROLE_RAND_NAME);
	}



}
