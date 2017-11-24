<?php
namespace protocol;

use network\Packet;


class ReqSceneMove
{
	private $sceneRotPos = null;
	private $forward = null;
	private $aniName = '';
	private $xAxis = 0;


	public function encode()
	{
		$packet = new Packet();
		$packet->writeBytes($this->sceneRotPos->getBytes());
		$packet->writeBytes($this->forward->getBytes());
		$packet->writeString($this->aniName);
		$packet->writeI16($this->xAxis);
		return $packet->encode(Msg::$P_REQ_SCENE_MOVE);
	}


	public function setSceneRotPos($sceneRotPos)
	{
		$this->sceneRotPos = $sceneRotPos;
	}

	public function setForward($forward)
	{
		$this->forward = $forward;
	}

	public function setAniName($aniName)
	{
		$this->aniName = $aniName;
	}

	public function setXAxis($xAxis)
	{
		$this->xAxis = $xAxis;
	}

}
