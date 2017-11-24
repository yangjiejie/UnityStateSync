<?php
namespace protocol;

use network\Packet;


class MsgTestPhp
{
	private $u16 = 0;


	public function __construct(&$packet=null)
	{
		if ($packet)
		{
			$this->decode($packet);
		}
	}

	public function decode(&$packet)
	{
		$this->u16 = $packet->readU16();
	}

	public function encode()
	{
		$packet = new Packet();
		$packet->writeU16($this->u16);
		return $packet->readBytes();
	}

	public function getBytes()
	{
		return $this->encode();
	}


	public function setU16($u16)
	{
		$this->u16 = $u16;
	}
	public function getU16()
	{
		return $this->u16;
	}

}
