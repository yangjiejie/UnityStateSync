<?php
namespace protocol;

use network\Packet;


class ReqSceneReqPlayers
{


	public function encode()
	{
		$packet = new Packet();
		return $packet->encode(Msg::$P_REQ_SCENE_REQ_PLAYERS);
	}



}
