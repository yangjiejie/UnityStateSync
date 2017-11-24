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


	public function encode()
	{
		$packet = new Packet();
		$packet->writeU64($this->u64);
		$packet->writeString($this->strxx);
		$packet->writeBytes($this->msgReq->getBytes());
		$packet->writeU8($this->msgOptFlag);
		if ($this->msgOptFlag == 1)
		{
			$packet->writeBytes($this->msgOpt->getBytes());
		}
		$msgRepCount = count($this->msgRep);
		$packet->writeU16($msgRepCount);
		foreach ($this->msgRep as $msgRep)
		{
			$packet->writeBytes($msgRep->getBytes());
		}
		return $packet->encode(Msg::$P_ACK_TEST_PHP_OK);
	}


	public function setU64($u64)
	{
		$this->u64 = $u64;
	}

	public function setStrxx($strxx)
	{
		$this->strxx = $strxx;
	}

	public function setMsgReq($msgReq)
	{
		$this->msgReq = $msgReq;
	}

	public function setMsgOpt($msgOpt)
	{
		$this->msgOptFlag = 1;
		$this->msgOpt = $msgOpt;
	}

	public function setMsgRep($msgRep)
	{
		$this->msgRep = $msgRep;
	}

}
