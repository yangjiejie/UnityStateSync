<?php
namespace protocol;

use network\Packet;


class AckRoleRandNameOk
{
	private $uname = '';


	public function encode()
	{
		$packet = new Packet();
		$packet->writeString($this->uname);
		return $packet->encode(Msg::$P_ACK_ROLE_RAND_NAME_OK);
	}


	public function setUname($uname)
	{
		$this->uname = $uname;
	}

}
