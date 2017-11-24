<?php
namespace protocol;

use network\Packet;


class ReqSceneEnter
{
	private $doorId = 0;


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->doorId = $packet->readU32();
	}


	public function getDoorId()
	{
		return $this->doorId;
	}

}
