package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqSceneEnter
{
	private int door_id;


	public ReqSceneEnter(Packet packet)
	{
		door_id = packet.readInt();
	}



	public long getDoorId()
	{
		return PacketUtil.readUInt(this.door_id);
	}

}
