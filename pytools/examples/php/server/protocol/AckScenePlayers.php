<?php
namespace protocol;

use network\Packet;


class AckScenePlayers
{
	private $players = [];


	public function encode()
	{
		$packet = new Packet();
		$playersCount = count($this->players);
		$packet->writeU16($playersCount);
		foreach ($this->players as $players)
		{
			$packet->writeBytes($players->getBytes());
		}
		return $packet->encode(Msg::$P_ACK_SCENE_PLAYERS);
	}


	public function setPlayers($players)
	{
		$this->players = $players;
	}

}
