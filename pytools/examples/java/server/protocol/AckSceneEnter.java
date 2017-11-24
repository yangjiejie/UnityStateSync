package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class AckSceneEnter
{
	private MsgScenePlayer player;


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeBytes(player.getBytes());
		return packet.encode((short)Msg.P_ACK_SCENE_ENTER);
	}



	public void setPlayer(MsgScenePlayer player)
	{
		this.player = player;
	}

}
