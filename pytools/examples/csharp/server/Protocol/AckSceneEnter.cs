using System.Collections;
using System.Collections.Generic;


public class AckSceneEnter
{
	private MsgScenePlayer _player;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteBuffer(this._player.GetBuffer());
		packet.Encode(Msg.P_ACK_SCENE_ENTER);
		return packet;
	}


	public MsgScenePlayer player
	{
		get { return this._player; }
		set { this._player = value; }
	}

}
