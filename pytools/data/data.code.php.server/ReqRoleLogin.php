<?php
namespace protocol;

use network\Packet;


class ReqRoleLogin
{
	private $uid = 0;
	private $uuid = 0;
	private $sid = 0;
	private $cid = 0;
	private $loginTime = 0;
	private $pwd = '';
	private $relink = 0;
	private $debug = 0;
	private $os = '';
	private $version = '';


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
		$this->loginTime = $packet->readU32();
		$this->pwd = $packet->readString();
		$this->relink = $packet->readU8();
		$this->debug = $packet->readU8();
		$this->os = $packet->readString();
		$this->version = $packet->readString();
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

	public function getLoginTime()
	{
		return $this->loginTime;
	}

	public function getPwd()
	{
		return $this->pwd;
	}

	public function getRelink()
	{
		return $this->relink;
	}

	public function getDebug()
	{
		return $this->debug;
	}

	public function getOs()
	{
		return $this->os;
	}

	public function getVersion()
	{
		return $this->version;
	}

}
