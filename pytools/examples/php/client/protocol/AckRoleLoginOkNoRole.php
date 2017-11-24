<?php
namespace protocol;

use network\Packet;


class AckRoleLoginOkNoRole
{


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
	}



}
