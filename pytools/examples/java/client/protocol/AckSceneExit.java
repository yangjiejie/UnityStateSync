package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckSceneExit
{
	private int uid;


	public AckSceneExit(Packet packet)
	{
		uid = packet.readInt();
	}



	public long getUid()
	{
		return PacketUtil.readUInt(this.uid);
	}

}
