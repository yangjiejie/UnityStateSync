using System.Collections;
using System.Collections.Generic;


public class AckSceneEnter
{
	private MsgScenePlayer _player;


	public AckSceneEnter(Packet packet)
	{
		this._player = new MsgScenePlayer(packet);
	}


	public MsgScenePlayer player
	{
		get { return this._player; }
		set { this._player = value; }
	}

}
