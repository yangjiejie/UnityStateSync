<?php
namespace protocol;

use network\Packet;


class MsgSceneRotPos
{
	private $rotX = 0;
	private $rotY = 0;
	private $rotZ = 0;
	private $posX = 0;
	private $posY = 0;
	private $posZ = 0;


	public function __construct(&$packet=null)
	{
		if ($packet)
		{
			$this->decode($packet);
		}
	}

	public function decode(&$packet)
	{
		$this->rotX = $packet->readI16();
		$this->rotY = $packet->readI16();
		$this->rotZ = $packet->readI16();
		$this->posX = $packet->readI16();
		$this->posY = $packet->readI16();
		$this->posZ = $packet->readI16();
	}

	public function encode()
	{
		$packet = new Packet();
		$packet->writeI16($this->rotX);
		$packet->writeI16($this->rotY);
		$packet->writeI16($this->rotZ);
		$packet->writeI16($this->posX);
		$packet->writeI16($this->posY);
		$packet->writeI16($this->posZ);
		return $packet->readBytes();
	}

	public function getBytes()
	{
		return $this->encode();
	}


	public function setRotX($rotX)
	{
		$this->rotX = $rotX;
	}
	public function getRotX()
	{
		return $this->rotX;
	}

	public function setRotY($rotY)
	{
		$this->rotY = $rotY;
	}
	public function getRotY()
	{
		return $this->rotY;
	}

	public function setRotZ($rotZ)
	{
		$this->rotZ = $rotZ;
	}
	public function getRotZ()
	{
		return $this->rotZ;
	}

	public function setPosX($posX)
	{
		$this->posX = $posX;
	}
	public function getPosX()
	{
		return $this->posX;
	}

	public function setPosY($posY)
	{
		$this->posY = $posY;
	}
	public function getPosY()
	{
		return $this->posY;
	}

	public function setPosZ($posZ)
	{
		$this->posZ = $posZ;
	}
	public function getPosZ()
	{
		return $this->posZ;
	}

}
