<?php
namespace protocol;

use network\Packet;


class AckRoleLoginOkNoRole
{


	public function encode()
	{
		$packet = new Packet();
		return $packet->encode(Msg::$P_ACK_ROLE_LOGIN_OK_NO_ROLE);
	}



}
