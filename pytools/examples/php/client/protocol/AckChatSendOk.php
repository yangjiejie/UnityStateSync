<?php
namespace protocol;

use network\Packet;


class AckChatSendOk
{
	private $channel = 0;
	private $uid = 0;
	private $uname = '';
	private $content = '';


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->channel = $packet->readU8();
		$this->uid = $packet->readU32();
		$this->uname = $packet->readString();
		$this->content = $packet->readString();
	}


	public function getChannel()
	{
		return $this->channel;
	}

	public function getUid()
	{
		return $this->uid;
	}

	public function getUname()
	{
		return $this->uname;
	}

	public function getContent()
	{
		return $this->content;
	}

}
