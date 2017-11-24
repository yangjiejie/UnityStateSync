package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqSceneEnter
{
	private int door_id;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeInt(door_id);
		return packet.encode((short)Msg.P_REQ_SCENE_ENTER);
	}



	public void setDoorId(int door_id)
	{
		this.door_id = door_id;
	}

}
