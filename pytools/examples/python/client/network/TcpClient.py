#!/usr/bin/env python
# coding:utf-8
from Packet import Packet
import packet_util

from protocol import msg, pb


class TcpClient(object):
	__socket 			= None

	__head_len			= 2
	__buffers			= ''
	__buffers_len 		= 0
	__buffers_tmp_len	= 512

	def __init__(self, socket):
		self.__socket = socket

	def run(self):
		if not self.__socket:
			raise('socket is None')

		reqTestXX = pb.ReqTestXX()
		reqTestXX.id_u8 = 255
		reqTestXX.id_u16 = 65535
		reqTestXX.id_u32 = 65535666
		reqTestXX.repeat_id_u8 = [254,255]
		reqTestXX.optional_id_u8 = 255
		self.send(reqTestXX.encode())

		while True:
			buffers_tmp = self.__socket.recv(self.__buffers_tmp_len)
			self.__buffers += buffers_tmp
			self.__buffers_len += len(buffers_tmp)

			while True:
				if self.__buffers_len > self.__head_len:
					head_buff 	= self.__buffers[:2]
					package_len	= packet_util.read_u16(head_buff)
					if self.__buffers_len >= self.__head_len + package_len:
						packet_id_buff 	= self.__buffers[2:4]
						packet_buff 	= self.__buffers[4:package_len + self.__head_len + 2]
						packet_id 		= packet_util.read_u16(packet_id_buff)

						body_len		= self.__head_len + package_len

						self.__buffers 	= self.__buffers[body_len:]
						self.__buffers_len -= body_len
						packet 			= Packet(packet_buff)
						self.dispath(packet_id, packet)
					else:
						break
				else:
					break

	def dispath(self, packet_id, packet):
		print
		print('packet_id:', packet_id)
		print
		if packet_id == msg.P_ACK_TEST_X_X:
			ackTestXX = pb.AckTestXX(packet)
			print('ackTestXX.id_u8:', ackTestXX.id_u8)
			print('ackTestXX.id_u16: ', ackTestXX.id_u16)
			print('ackTestXX.id_u32: ', ackTestXX.id_u32)
			print('ackTestXX.repeat_id_u8: ', ackTestXX.repeat_id_u8)
			print('ackTestXX.optional_id_u8: ', ackTestXX.optional_id_u8)

			msgRoleBase = pb.MsgRoleBase()
			msgRoleBase.uid = 10086
			msgRoleBase.uname = 'mirahs'

			reqTestSend = pb.ReqTestSend()
			reqTestSend.id_u8 = 255
			reqTestSend.role_base = msgRoleBase
			reqTestSend.id_f32 = [1.23,1.24]
			reqTestSend.id_op_u8 = 255
			reqTestSend.op_role_base = msgRoleBase
			self.send(reqTestSend.encode())

		elif packet_id == msg.P_ACK_TEST_SEND_OK:
			ackTestSendOk = pb.AckTestSendOk(packet)
			print('ackTestSendOk.id_u8:', ackTestSendOk.id_u8)
			print('ackTestSendOk.id_u16: ', ackTestSendOk.role_base)
			print('ackTestSendOk.id_u32: ', ackTestSendOk.id_f32)
			print('ackTestSendOk.repeat_id_u8: ', ackTestSendOk.id_op_u8)
			print('ackTestSendOk.optional_id_u8: ', ackTestSendOk.op_role_base)



	def send(self, buff):
		self.__socket.send(buff)
