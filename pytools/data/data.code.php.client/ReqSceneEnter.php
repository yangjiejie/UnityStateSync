<?php
namespace protocol;

use network\Packet;


class ReqSceneEnter
{
	private $doorId = 0;


	public function encode()
	{
		$packet = new Packet();
		$packet->writeU32($this->doorId);
		return $packet->encode(Msg::$P_REQ_SCENE_ENTER);
	}


	public function setDoorId($doorId)
	{
		$this->doorId = $doorId;
	}

}
