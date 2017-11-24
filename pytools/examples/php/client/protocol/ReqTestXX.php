<?php
namespace protocol;

use network\Packet;


class ReqTestXX
{
	private $idU8 = 0;
	private $idU16 = 0;
	private $idU32 = 0;
	private $repeatIdU8 = [];
	private $optionalIdU8Flag = 0;
	private $optionalIdU8 = 0;


	public function encode()
	{
		$packet = new Packet();
		$packet->writeU8($this->idU8);
		$packet->writeU16($this->idU16);
		$packet->writeU32($this->idU32);
		$repeatIdU8Count = count($this->repeatIdU8);
		$packet->writeU16($repeatIdU8Count);
		foreach ($this->repeatIdU8 as $repeatIdU8)
		{
			$packet->writeU8($repeatIdU8);
		}
		$packet->writeU8($this->optionalIdU8Flag);
		if ($this->optionalIdU8Flag == 1)
		{
			$packet->writeU8($this->optionalIdU8);
		}
		return $packet->encode(Msg::$P_REQ_TEST_X_X);
	}


	public function setIdU8($idU8)
	{
		$this->idU8 = $idU8;
	}

	public function setIdU16($idU16)
	{
		$this->idU16 = $idU16;
	}

	public function setIdU32($idU32)
	{
		$this->idU32 = $idU32;
	}

	public function setRepeatIdU8($repeatIdU8)
	{
		$this->repeatIdU8 = $repeatIdU8;
	}

	public function setOptionalIdU8($optionalIdU8)
	{
		$this->optionalIdU8Flag = 1;
		$this->optionalIdU8 = $optionalIdU8;
	}

}
