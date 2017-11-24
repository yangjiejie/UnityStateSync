<?php
namespace protocol;

use network\Packet;


class ReqSceneReqPlayers
{


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
	}



}
