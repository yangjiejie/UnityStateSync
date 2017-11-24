<?php
require_once 'vendor/autoload.php';

use network\PacketUtil;
use network\Packet;


set_time_limit(0);


$address	= "127.0.0.1";
$port		= 8888;


function send($socket, $buff)
{
	socket_write($socket, $buff, strlen($buff));
}

function dispath($socket, $packet_id, $packet)
{
	echo "\n";
	echo "\$packet_id: " . $packet_id . "\n";
	switch ($packet_id)
	{
		case \protocol\Msg::$P_ACK_TEST_PHP_OK:
		{
			$ackTestPhpOk = new \protocol\AckTestPhpOk($packet);
			echo '$ackTestPhpOk->getU64(): ' . $ackTestPhpOk->getU64() . "\n";
			echo '$ackTestPhpOk->getStrxx(): ' . $ackTestPhpOk->getStrxx() . "\n";
			echo '$ackTestPhpOk->getMsgReq()->getU16(): ' . $ackTestPhpOk->getMsgReq()->getU16() . "\n";
			echo '$ackTestPhpOk->getMsgOpt()->getU16(): ' . $ackTestPhpOk->getMsgOpt()->getU16() . "\n";
			echo '$ackTestPhpOk->getMsgRep()[0]->getU16(): ' . $ackTestPhpOk->getMsgRep()[0]->getU16() . "\n";

			break;
		}
	}
}


$socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
if (!$socket)
{
	echo "socket_create() failed, reason: " . socket_strerror(socket_last_error()) . "\n";
	exit();
}

$result = socket_connect($socket, $address, $port);
if (!$result)
{
	echo "socket_connect() failed, reason: ". socket_strerror(socket_last_error()). "\n";
	exit();
}
echo "connect server success\n";


$msgTestPhp = new \protocol\MsgTestPhp();
$msgTestPhp->setU16(11111);

$reqTestPhp = new \protocol\ReqTestPhp();
$reqTestPhp->setU64(10086777);
$reqTestPhp->setStrxx('mirahs');
$reqTestPhp->setMsgReq($msgTestPhp);
$reqTestPhp->setMsgOpt($msgTestPhp);
$reqTestPhp->setMsgRep(array($msgTestPhp, $msgTestPhp));

send($socket, $reqTestPhp->encode());


$head_len		= 2;
$buffers		= "";
$buffers_len	= 0;
$buffers_tmp_len= 512;

while (true)
{
	$buffs_tmp 	= socket_read($socket, $buffers_tmp_len);
	$read_len 	= strlen($buffs_tmp);
	$buffers 	.= $buffs_tmp;
	$buffers_len+= $read_len;

	while (true)
	{
		if ($buffers_len > $head_len)
		{
			$head_buff 	= substr($buffers, 0, 2);
			$package_len= PacketUtil::readU16($head_buff);
			if ($buffers_len >= $head_len + $package_len)
			{
				$packet_id_buff = substr($buffers, 2, 2);
				$packet_buff 	= substr($buffers, 4, $package_len);

				$packet_id 		= PacketUtil::readU16($packet_id_buff);
				$body_len		= $head_len + $package_len;

				$buffers 		= substr($buffers, $body_len);
				$buffers_len 	-= $body_len;

				$packet 		= new Packet($packet_buff);
				dispath($socket, $packet_id, $packet);
			}
			else
			{
				break;
			}
		}
		else
		{
			break;
		}
	}
}