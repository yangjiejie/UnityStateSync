<?php
namespace protocol;

use network\Packet;


class AckChatSendOk
{
	private $channel = 0;
	private $uid = 0;
	private $uname = '';
	private $content = '';


	public function encode()
	{
		$packet = new Packet();
		$packet->writeU8($this->channel);
		$packet->writeU32($this->uid);
		$packet->writeString($this->uname);
		$packet->writeString($this->content);
		return $packet->encode(Msg::$P_ACK_CHAT_SEND_OK);
	}


	public function setChannel($channel)
	{
		$this->channel = $channel;
	}

	public function setUid($uid)
	{
		$this->uid = $uid;
	}

	public function setUname($uname)
	{
		$this->uname = $uname;
	}

	public function setContent($content)
	{
		$this->content = $content;
	}

}
