<?php
namespace protocol;

use network\Packet;


class AckTestPhpOk
{
	private $u64 = 0;
	private $strxx = '';
	private $msgReq = null;
	private $msgOptFlag = 0;
	private $msgOpt = null;
	private $msgRep = [];


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->u64 = $packet->readU64();
		$this->strxx = $packet->readString();
		$this->msgReq = new MsgTestPhp($packet);
		$this->msgOptFlag = $packet->readU8();
		if ($this->msgOptFlag == 1)
		{
			$this->msgOpt = new MsgTestPhp($packet);
		}
		$msgRepCount = $packet->readU16();
		for ($i = 0; $i < $msgRepCount; $i++)
		{
			array_push($this->msgRep, new MsgTestPhp($packet));
		}
	}


	public function getU64()
	{
		return $this->u64;
	}

	public function getStrxx()
	{
		return $this->strxx;
	}

	public function getMsgReq()
	{
		return $this->msgReq;
	}

	public function getMsgOpt()
	{
		return $this->msgOpt;
	}

	public function getMsgRep()
	{
		return $this->msgRep;
	}

}
