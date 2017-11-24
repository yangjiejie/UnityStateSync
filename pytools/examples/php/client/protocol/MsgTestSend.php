<?php
namespace protocol;

use network\Packet;


class MsgTestSend
{
	private $idU8 = 0;
	private $roleBase = null;
	private $idF32 = [];
	private $idOpU8Flag = 0;
	private $idOpU8 = 0;
	private $opRoleBaseFlag = 0;
	private $opRoleBase = null;


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
		$this->roleBase = new MsgRoleBase($packet);
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
		$this->opRoleBaseFlag = $packet->readU8();
		if ($this->opRoleBaseFlag == 1)
		{
			$this->opRoleBase = new MsgRoleBase($packet);
		}
	}

	public function encode()
	{
		$packet = new Packet();
		$packet->writeU8($this->idU8);
		$packet->writeBytes($this->roleBase->getBytes());
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
		$packet->writeU8($this->opRoleBaseFlag);
		if ($this->opRoleBaseFlag == 1)
		{
			$packet->writeBytes($this->opRoleBase->getBytes());
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

	public function setRoleBase($roleBase)
	{
		$this->roleBase = $roleBase;
	}
	public function getRoleBase()
	{
		return $this->roleBase;
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

	public function setOpRoleBase($opRoleBase)
	{
		$this->opRoleBaseFlag = 1;
		$this->opRoleBase = $opRoleBase;
	}
	public function getOpRoleBase()
	{
		return $this->opRoleBase;
	}

}
