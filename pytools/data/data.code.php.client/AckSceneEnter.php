<?php
namespace protocol;

use network\Packet;


class AckSceneEnter
{
	private $player = null;


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->player = new MsgScenePlayer($packet);
	}


	public function getPlayer()
	{
		return $this->player;
	}

}
