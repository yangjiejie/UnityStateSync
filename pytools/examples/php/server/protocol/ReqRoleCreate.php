<?php
namespace protocol;

use network\Packet;


class ReqRoleCreate
{
	private $uid = 0;
	private $uuid = 0;
	private $sid = 0;
	private $cid = 0;
	private $os = '';
	private $version = '';
	private $uname = '';
	private $source = '';
	private $sourceSub = '';
	private $loginTime = 0;


	public function __construct(&$packet)
	{
		$this->decode($packet);
	}

	public function decode(&$packet)
	{
		$this->uid = $packet->readU32();
		$this->uuid = $packet->readU32();
		$this->sid = $packet->readU16();
		$this->cid = $packet->readU16();
		$this->os = $packet->readString();
		$this->version = $packet->readString();
		$this->uname = $packet->readString();
		$this->source = $packet->readString();
		$this->sourceSub = $packet->readString();
		$this->loginTime = $packet->readU32();
	}


	public function getUid()
	{
		return $this->uid;
	}

	public function getUuid()
	{
		return $this->uuid;
	}

	public function getSid()
	{
		return $this->sid;
	}

	public function getCid()
	{
		return $this->cid;
	}

	public function getOs()
	{
		return $this->os;
	}

	public function getVersion()
	{
		return $this->version;
	}

	public function getUname()
	{
		return $this->uname;
	}

	public function getSource()
	{
		return $this->source;
	}

	public function getSourceSub()
	{
		return $this->sourceSub;
	}

	public function getLoginTime()
	{
		return $this->loginTime;
	}

}
