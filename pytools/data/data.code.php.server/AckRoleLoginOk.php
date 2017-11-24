<?php
namespace protocol;

use network\Packet;


class AckRoleLoginOk
{
	private $uname = '';


	public function encode()
	{
		$packet = new Packet();
		$packet->writeString($this->uname);
		return $packet->encode(Msg::$P_ACK_ROLE_LOGIN_OK);
	}


	public function setUname($uname)
	{
		$this->uname = $uname;
	}

}
