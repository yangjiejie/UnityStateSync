<?php
namespace protocol;

use network\Packet;


class ReqRoleRandName
{


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
	}



}
