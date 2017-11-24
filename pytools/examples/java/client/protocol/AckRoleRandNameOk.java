package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckRoleRandNameOk
{
	private String uname;


	public AckRoleRandNameOk(Packet packet)
	{
		uname = packet.readString();
	}



	public String getUname()
	{
		return this.uname;
	}

}
