<?php
namespace protocol;

use network\Packet;


class MsgSceneVector3
{
	private $x = 0;
	private $y = 0;
	private $z = 0;


	public function __construct(&$packet=null)
	{
		if ($packet)
		{
			$this->decode($packet);
		}
	}

	public function decode(&$packet)
	{
		$this->x = $packet->readI16();
		$this->y = $packet->readI16();
		$this->z = $packet->readI16();
	}

	public function encode()
	{
		$packet = new Packet();
		$packet->writeI16($this->x);
		$packet->writeI16($this->y);
		$packet->writeI16($this->z);
		return $packet->readBytes();
	}

	public function getBytes()
	{
		return $this->encode();
	}


	public function setX($x)
	{
		$this->x = $x;
	}
	public function getX()
	{
		return $this->x;
	}

	public function setY($y)
	{
		$this->y = $y;
	}
	public function getY()
	{
		return $this->y;
	}

	public function setZ($z)
	{
		$this->z = $z;
	}
	public function getZ()
	{
		return $this->z;
	}

}
