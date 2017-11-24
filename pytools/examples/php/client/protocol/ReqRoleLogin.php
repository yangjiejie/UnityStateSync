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


	public function encode()
	{
		$packet = new Packet();
		$packet->writeU32($this->uid);
		$packet->writeU32($this->uuid);
		$packet->writeU16($this->sid);
		$packet->writeU16($this->cid);
		$packet->writeU32($this->loginTime);
		$packet->writeString($this->pwd);
		$packet->writeU8($this->relink);
		$packet->writeU8($this->debug);
		$packet->writeString($this->os);
		$packet->writeString($this->version);
		return $packet->encode(Msg::$P_REQ_ROLE_LOGIN);
	}


	public function setUid($uid)
	{
		$this->uid = $uid;
	}

	public function setUuid($uuid)
	{
		$this->uuid = $uuid;
	}

	public function setSid($sid)
	{
		$this->sid = $sid;
	}

	public function setCid($cid)
	{
		$this->cid = $cid;
	}

	public function setLoginTime($loginTime)
	{
		$this->loginTime = $loginTime;
	}

	public function setPwd($pwd)
	{
		$this->pwd = $pwd;
	}

	public function setRelink($relink)
	{
		$this->relink = $relink;
	}

	public function setDebug($debug)
	{
		$this->debug = $debug;
	}

	public function setOs($os)
	{
		$this->os = $os;
	}

	public function setVersion($version)
	{
		$this->version = $version;
	}

}
