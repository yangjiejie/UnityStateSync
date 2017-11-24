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


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->idU8 = $packet->readU8();
		$this->idU16 = $packet->readU16();
		$this->idU32 = $packet->readU32();
		$repeatIdU8Count = $packet->readU16();
		for ($i = 0; $i < $repeatIdU8Count; $i++)
		{
			array_push($this->repeatIdU8, $packet->readU8());
		}
		$this->optionalIdU8Flag = $packet->readU8();
		if ($this->optionalIdU8Flag == 1)
		{
			$this->optionalIdU8 = $packet->readU8();
		}
	}


	public function getIdU8()
	{
		return $this->idU8;
	}

	public function getIdU16()
	{
		return $this->idU16;
	}

	public function getIdU32()
	{
		return $this->idU32;
	}

	public function getRepeatIdU8()
	{
		return $this->repeatIdU8;
	}

	public function getOptionalIdU8()
	{
		return $this->optionalIdU8;
	}

}
