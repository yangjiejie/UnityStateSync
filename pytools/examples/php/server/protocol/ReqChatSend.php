<?php
namespace protocol;

use network\Packet;


class ReqChatSend
{
	private $channel = 0;
	private $destUid = 0;
	private $content = '';


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->channel = $packet->readU8();
		$this->destUid = $packet->readU32();
		$this->content = $packet->readString();
	}


	public function getChannel()
	{
		return $this->channel;
	}

	public function getDestUid()
	{
		return $this->destUid;
	}

	public function getContent()
	{
		return $this->content;
	}

}
