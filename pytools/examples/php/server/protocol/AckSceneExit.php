<?php
namespace protocol;

use network\Packet;


class AckSceneExit
{
	private $uid = 0;


	public function encode()
	{
		$packet = new Packet();
		$packet->writeU32($this->uid);
		return $packet->encode(Msg::$P_ACK_SCENE_EXIT);
	}


	public function setUid($uid)
	{
		$this->uid = $uid;
	}

}
