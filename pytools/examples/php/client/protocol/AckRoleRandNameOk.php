<?php
namespace protocol;

use network\Packet;


class AckRoleRandNameOk
{
	private $uname = '';


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->uname = $packet->readString();
	}


	public function getUname()
	{
		return $this->uname;
	}

}
