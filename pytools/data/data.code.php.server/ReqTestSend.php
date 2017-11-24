<?php
namespace protocol;

use network\Packet;


class ReqTestSend
{
	private $idU8 = 0;
	private $roleBase = null;
	private $idF32 = [];
	private $idOpU8Flag = 0;
	private $idOpU8 = 0;
	private $opRoleBaseFlag = 0;
	private $opRoleBase = null;


	public function __construct(&$packet)
	{
		$this->decode($packet);
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


	public function getIdU8()
	{
		return $this->idU8;
	}

	public function getRoleBase()
	{
		return $this->roleBase;
	}

	public function getIdF32()
	{
		return $this->idF32;
	}

	public function getIdOpU8()
	{
		return $this->idOpU8;
	}

	public function getOpRoleBase()
	{
		return $this->opRoleBase;
	}

}
