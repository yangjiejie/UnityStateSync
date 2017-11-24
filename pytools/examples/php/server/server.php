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
		case \protocol\Msg::$P_REQ_TEST_PHP:
		{
			$reqTestPhp = new \protocol\ReqTestPhp($packet);
			echo '$reqTestPhp->getU64(): ' . $reqTestPhp->getU64() . "\n";
			echo '$reqTestPhp->getStrxx(): ' . $reqTestPhp->getStrxx() . "\n";
			echo '$reqTestPhp->getMsgReq()->getU16(): ' . $reqTestPhp->getMsgReq()->getU16() . "\n";
			echo '$reqTestPhp->getMsgOpt()->getU16(): ' . $reqTestPhp->getMsgOpt()->getU16() . "\n";
			echo '$reqTestPhp->getMsgRep()[0]->getU16(): ' . $reqTestPhp->getMsgRep()[0]->getU16() . "\n";


			$ackTestPhpOk = new \protocol\AckTestPhpOk();
			$ackTestPhpOk->setU64(10086888);
			$ackTestPhpOk->setStrxx('php');
			$ackTestPhpOk->setMsgReq($reqTestPhp->getMsgReq());
			$ackTestPhpOk->setMsgOpt($reqTestPhp->getMsgOpt());
			$ackTestPhpOk->setMsgRep(array($reqTestPhp->getMsgReq(), $reqTestPhp->getMsgReq()));

			send($socket, $ackTestPhpOk->encode());


			break;
		}
	}
}


if (($socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)) === false)
{
	echo "socket_create() failed, reason: " . socket_strerror(socket_last_error()) . "\n";
	exit();
}
if (socket_bind($socket, $address, $port) === false)
{
	echo "socket_create() failed, reason: " . socket_strerror(socket_last_error()) . "\n";
	exit();
}
if (socket_listen($socket, 1024) === false)
{
	echo "socket_bind() failed, reason: " . socket_strerror(socket_last_error()) . "\n";
	exit();
}
echo "server listen " . $address . ":" . $port . " success\n";

while (true)
{
	if (($client = socket_accept($socket)) === false)
	{
		echo "socket_accpet failed, reason: " . socket_strerror(socket_last_error()) . "\n";
		exit();
	}

	$head_len		= 2;
	$buffers		= "";
	$buffers_len	= 0;
	$buffers_tmp_len= 512;

	while (true)
	{
		$buffs_tmp 	= socket_read($client, $buffers_tmp_len);
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
					dispath($client, $packet_id, $packet);
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

}
