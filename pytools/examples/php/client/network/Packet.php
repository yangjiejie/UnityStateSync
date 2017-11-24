<?php
namespace network;


class Packet
{
	private $buffers = '';


	public function __construct($buff='')
	{
		$this->buffers = $buff;
	}


	public function encode($packetId)
	{
		$bodyLen 	= strlen($this->buffers);

		$bufferLen	= pack('n', $bodyLen + 2);
		$bufferPid	= pack('n', $packetId);

		return $bufferLen . $bufferPid . $this->buffers;
	}


	public function getBuffers()
	{
		return $this->buffers;
	}


	public function writeU8($val)
	{
		$this->append('C', $val);
	}

	public function writeI8($val)
	{
		$this->append('c', $val);
	}

	public function writeU16($val)
	{
		$this->append('n', $val);
	}

	public function writeU32($val)
	{
		$this->append('N', $val);
	}

	public function writeU64($val)
	{
		$this->append('J', $val);
	}

	public function writeString($str)
	{
		$len = strlen($str);

		$this->writeU16($len);
		$this->append('a' . $len, $str);
	}

	public function writeBytes($buff)
	{
		$this->buffers .= $buff;
	}


	public function readU8()
	{
		return $this->substract('C', 1, 'U8');
	}

	public function readI8()
	{
		return $this->substract('c', 1, 'I8');
	}

	public function readU16()
	{
		return $this->substract('n', 2, 'U16');
	}

	public function readU32()
	{
		return $this->substract('N', 4, 'U32');
	}

	public function readU64()
	{
		return $this->substract('J', 8, 'U64');
	}

	public function readString()
	{
		$len = $this->readU16();
		$flag= 'a' . $len . 'String';
		$rs  = unpack($flag, $this->buffers);
		$this->buffers = substr($this->buffers, $len);

		return $rs['String'];
	}

	public function readBytes()
	{
		return $this->buffers;
	}


	private function append($flag, $val)
	{
		$tmp = pack($flag, $val);

		$this->buffers .= $tmp;
	}

	private function substract($flag, $size, $varName)
	{
		$rs = unpack($flag . $varName, $this->buffers);

		$this->buffers = substr($this->buffers, $size);

		return $rs[ $varName ];
	}

}
