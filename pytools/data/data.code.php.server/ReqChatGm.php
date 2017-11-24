<?php
namespace protocol;

use network\Packet;


class ReqChatGm
{
	private $content = '';


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->content = $packet->readString();
	}


	public function getContent()
	{
		return $this->content;
	}

}
