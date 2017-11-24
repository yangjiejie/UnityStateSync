<?php
namespace protocol;

use network\Packet;


class ReqSceneEnterFly
{
	private $mapId = 0;


	public function encode()
	{
		$packet = new Packet();
		$packet->writeU32($this->mapId);
		return $packet->encode(Msg::$P_REQ_SCENE_ENTER_FLY);
	}


	public function setMapId($mapId)
	{
		$this->mapId = $mapId;
	}

}
