<?php
namespace protocol;

use network\Packet;


class ReqRoleRandName
{


	public function encode()
	{
		$packet = new Packet();
		return $packet->encode(Msg::$P_REQ_ROLE_RAND_NAME);
	}



}
