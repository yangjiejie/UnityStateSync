<?php
namespace protocol;

use network\Packet;


class MsgTestXX
{
	private $idU8 = 0;
	private $idF32 = [];
	private $idOpU8Flag = 0;
	private $idOpU8 = 0;


	public function __construct(&$packet=null)
	{
		if ($packet)
		{
			$this->decode($packet);
		}
	}

	public function decode(&$packet)
	{
		$this->idU8 = $packet->readU8();
		$idF32Count = $packet->readU16();
		for ($i = 0; $i < $idF32Count; $i++)
		{
			array_push($this->idF32, $packet->readF32());
		}
		$this->idOpU8Flag = $packet->readU8();
		if ($this->idOpU8Flag == 1)
		{
			$this->idOpU8 = $packet->readU8();
		}
	}

	public function encode()
	{
		$packet = new Packet();
		$packet->writeU8($this->idU8);
		$idF32Count = count($this->idF32);
		$packet->writeU16($idF32Count);
		foreach ($this->idF32 as $idF32)
		{
			$packet->writeF32($idF32);
		}
		$packet->writeU8($this->idOpU8Flag);
		if ($this->idOpU8Flag == 1)
		{
			$packet->writeU8($this->idOpU8);
		}
		return $packet->readBytes();
	}

	public function getBytes()
	{
		return $this->encode();
	}


	public function setIdU8($idU8)
	{
		$this->idU8 = $idU8;
	}
	public function getIdU8()
	{
		return $this->idU8;
	}

	public function setIdF32($idF32)
	{
		$this->idF32 = $idF32;
	}
	public function getIdF32()
	{
		return $this->idF32;
	}

	public function setIdOpU8($idOpU8)
	{
		$this->idOpU8Flag = 1;
		$this->idOpU8 = $idOpU8;
	}
	public function getIdOpU8()
	{
		return $this->idOpU8;
	}

}
