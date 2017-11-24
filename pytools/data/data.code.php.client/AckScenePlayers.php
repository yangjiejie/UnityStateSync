<?php
namespace protocol;

use network\Packet;


class AckScenePlayers
{
	private $players = [];


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$playersCount = $packet->readU16();
		for ($i = 0; $i < $playersCount; $i++)
		{
			array_push($this->players, new MsgScenePlayer($packet));
		}
	}


	public function getPlayers()
	{
		return $this->players;
	}

}
