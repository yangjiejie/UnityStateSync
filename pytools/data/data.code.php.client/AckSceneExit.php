<?php
namespace protocol;

use network\Packet;


class AckSceneExit
{
	private $uid = 0;


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->uid = $packet->readU32();
	}


	public function getUid()
	{
		return $this->uid;
	}

}
