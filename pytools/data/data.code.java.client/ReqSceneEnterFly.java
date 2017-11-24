package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqSceneEnterFly
{
	private int map_id;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeInt(map_id);
		return packet.encode((short)Msg.P_REQ_SCENE_ENTER_FLY);
	}



	public void setMapId(int map_id)
	{
		this.map_id = map_id;
	}

}
