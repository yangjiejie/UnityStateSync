<?php
namespace protocol;

use network\Packet;


class ReqChatGm
{
	private $content = '';


	public function encode()
	{
		$packet = new Packet();
		$packet->writeString($this->content);
		return $packet->encode(Msg::$P_REQ_CHAT_GM);
	}


	public function setContent($content)
	{
		$this->content = $content;
	}

}
