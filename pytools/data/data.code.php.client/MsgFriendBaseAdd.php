<?php
namespace protocol;

use network\Packet;


class MsgFriendBaseAdd
{
	private $uid = 0;
	private $uname = '';


	public function __construct(&$packet=null)
	{
		if ($packet)
		{
			$this->decode($packet);
		}
	}

	public function decode(&$packet)
	{
		$this->uid = $packet->readU32();
		$this->uname = $packet->readString();
	}

	public function encode()
	{
		$packet = new Packet();
		$packet->writeU32($this->uid);
		$packet->writeString($this->uname);
		return $packet->readBytes();
	}

	public function getBytes()
	{
		return $this->encode();
	}


	public function setUid($uid)
	{
		$this->uid = $uid;
	}
	public function getUid()
	{
		return $this->uid;
	}

	public function setUname($uname)
	{
		$this->uname = $uname;
	}
	public function getUname()
	{
		return $this->uname;
	}

}
