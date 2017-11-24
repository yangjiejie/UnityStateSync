<?php
namespace protocol;

use network\Packet;


class MsgScenePlayer
{
	private $uid = 0;
	private $sceneRotPos = null;


	public function __construct(&$packet=null)
	{
		if ($packet)
		{
			$this->decode($packet);
		}
	}

	public function decode(&$packet)
	{
		$this->uid = $packet->readU32();
		$this->sceneRotPos = new MsgSceneRotPos($packet);
	}

	public function encode()
	{
		$packet = new Packet();
		$packet->writeU32($this->uid);
		$packet->writeBytes($this->sceneRotPos->getBytes());
		return $packet->readBytes();
	}

	public function getBytes()
	{
		return $this->encode();
	}


	public function setUid($uid)
	{
		$this->uid = $uid;
	}
	public function getUid()
	{
		return $this->uid;
	}

	public function setSceneRotPos($sceneRotPos)
	{
		$this->sceneRotPos = $sceneRotPos;
	}
	public function getSceneRotPos()
	{
		return $this->sceneRotPos;
	}

}
