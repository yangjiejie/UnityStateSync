<?php
namespace protocol;

use network\Packet;


class ReqSceneMove
{
	private $sceneRotPos = null;
	private $forward = null;
	private $aniName = '';
	private $xAxis = 0;


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

}
