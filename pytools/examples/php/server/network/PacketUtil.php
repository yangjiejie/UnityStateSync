<?php
namespace network;


class PacketUtil
{
	public static function readU8($buff)
	{
		return self::read($buff, 'C');
	}

	public static function readI8($buff)
	{
		return self::read($buff, 'c');
	}

	public static function readU16($buff)
	{
		return self::read($buff, 'n');
	}

	public static function readU32($buff)
	{
		return self::read($buff, 'N');
	}

	public static function readU64($buff)
	{
		return self::read($buff, 'J');
	}

	public static function readString($buff)
	{
		$len = self::readU16($buff);
		$buff= substr($buff, 2);

		return self::read($buff, 'a' . $len);
	}


	private static function read($buff, $flag)
	{
		$rs = unpack($flag . 'return', $buff);

		return $rs['return'];
	}

}
