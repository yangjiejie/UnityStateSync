package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckRoleLoginOk
{
	private String uname;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeString(uname);
		return packet.encode((short)Msg.P_ACK_ROLE_LOGIN_OK);
	}



	public void setUname(String uname)
	{
		this.uname = uname;
	}

}
