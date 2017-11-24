<?php
namespace protocol;

use network\Packet;


class ReqChatSend
{
	private $channel = 0;
	private $destUid = 0;
	private $content = '';


	public function encode()
	{
		$packet = new Packet();
		$packet->writeU8($this->channel);
		$packet->writeU32($this->destUid);
		$packet->writeString($this->content);
		return $packet->encode(Msg::$P_REQ_CHAT_SEND);
	}


	public function setChannel($channel)
	{
		$this->channel = $channel;
	}

	public function setDestUid($destUid)
	{
		$this->destUid = $destUid;
	}

	public function setContent($content)
	{
		$this->content = $content;
	}

}
