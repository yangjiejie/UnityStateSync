<?php
namespace protocol;

use network\Packet;


class ReqSceneEnterFly
{
	private $mapId = 0;


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->mapId = $packet->readU32();
	}


	public function getMapId()
	{
		return $this->mapId;
	}

}
