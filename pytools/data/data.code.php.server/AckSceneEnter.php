<?php
namespace protocol;

use network\Packet;


class AckSceneEnter
{
	private $player = null;


	public function encode()
	{
		$packet = new Packet();
		$packet->writeBytes($this->player->getBytes());
		return $packet->encode(Msg::$P_ACK_SCENE_ENTER);
	}


	public function setPlayer($player)
	{
		$this->player = $player;
	}

}
