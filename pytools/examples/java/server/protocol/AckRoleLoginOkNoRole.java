package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckRoleLoginOkNoRole
{


	public byte[] encode()
	{
		Packet packet = new Packet();
		return packet.encode((short)Msg.P_ACK_ROLE_LOGIN_OK_NO_ROLE);
	}



}
