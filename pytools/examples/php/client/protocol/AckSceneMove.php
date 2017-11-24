<?php
namespace protocol;

use network\Packet;


class AckSceneMove
{
	private $sceneRotPos = null;
	private $forward = null;
	private $aniName = '';
	private $xAxis = 0;
	private $uid = 0;


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->sceneRotPos = new MsgSceneRotPos($packet);
		$this->forward = new MsgSceneVector3($packet);
		$this->aniName = $packet->readString();
		$this->xAxis = $packet->readI16();
		$this->uid = $packet->readU32();
	}


	public function getSceneRotPos()
	{
		return $this->sceneRotPos;
	}

	public function getForward()
	{
		return $this->forward;
	}

	public function getAniName()
	{
		return $this->aniName;
	}

	public function getXAxis()
	{
		return $this->xAxis;
	}

	public function getUid()
	{
		return $this->uid;
	}

}
