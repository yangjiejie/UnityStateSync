package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckRoleRandNameOk
{
	private String uname;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeString(uname);
		return packet.encode((short)Msg.P_ACK_ROLE_RAND_NAME_OK);
	}



	public void setUname(String uname)
	{
		this.uname = uname;
	}

}
