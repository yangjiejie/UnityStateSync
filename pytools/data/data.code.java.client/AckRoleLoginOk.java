package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckRoleLoginOk
{
	private String uname;


	public AckRoleLoginOk(Packet packet)
	{
		uname = packet.readString();
	}



	public String getUname()
	{
		return this.uname;
	}

}
