package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqSceneEnterFly
{
	private int map_id;


	public ReqSceneEnterFly(Packet packet)
	{
		map_id = packet.readInt();
	}



	public long getMapId()
	{
		return PacketUtil.readUInt(this.map_id);
	}

}
