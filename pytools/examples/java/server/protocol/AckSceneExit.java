package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckSceneExit
{
	private int uid;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeInt(uid);
		return packet.encode((short)Msg.P_ACK_SCENE_EXIT);
	}



	public void setUid(int uid)
	{
		this.uid = uid;
	}

}
