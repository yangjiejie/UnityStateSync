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


	public function encode()
	{
		$packet = new Packet();
		$packet->writeU32($this->uid);
		$packet->writeU32($this->uuid);
		$packet->writeU16($this->sid);
		$packet->writeU16($this->cid);
		$packet->writeString($this->os);
		$packet->writeString($this->version);
		$packet->writeString($this->uname);
		$packet->writeString($this->source);
		$packet->writeString($this->sourceSub);
		$packet->writeU32($this->loginTime);
		return $packet->encode(Msg::$P_REQ_ROLE_CREATE);
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

	public function setOs($os)
	{
		$this->os = $os;
	}

	public function setVersion($version)
	{
		$this->version = $version;
	}

	public function setUname($uname)
	{
		$this->uname = $uname;
	}

	public function setSource($source)
	{
		$this->source = $source;
	}

	public function setSourceSub($sourceSub)
	{
		$this->sourceSub = $sourceSub;
	}

	public function setLoginTime($loginTime)
	{
		$this->loginTime = $loginTime;
	}

}
