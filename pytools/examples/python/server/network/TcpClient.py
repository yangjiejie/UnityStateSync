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
		if packet_id == msg.P_REQ_TEST_X_X:
			reqTestXX = pb.ReqTestXX(packet)
			print('reqTestXX.id_u8:', reqTestXX.id_u8)
			print('reqTestXX.id_u16: ', reqTestXX.id_u16)
			print('reqTestXX.id_u32: ', reqTestXX.id_u32)
			print('reqTestXX.repeat_id_u8: ', reqTestXX.repeat_id_u8)
			print('reqTestXX.optional_id_u8: ', reqTestXX.optional_id_u8)

			ackTestXX = pb.AckTestXX()
			ackTestXX.id_u8 = 255
			ackTestXX.id_u16 = 65535
			ackTestXX.id_u32 = 65535666
			ackTestXX.repeat_id_u8 = [254,255]
			ackTestXX.optional_id_u8 = 255
			self.send(ackTestXX.encode())

		elif packet_id == msg.P_REQ_TEST_SEND:
			reqTestSend = pb.ReqTestSend(packet)
			print('reqTestSend.id_u8:', reqTestSend.id_u8)
			print('reqTestSend.id_u16: ', reqTestSend.role_base)
			print('reqTestSend.id_u32: ', reqTestSend.id_f32)
			print('reqTestSend.id_op_u8: ', reqTestSend.id_op_u8)
			print('reqTestSend.optional_id_u8: ', reqTestSend.op_role_base)

			msgRoleBase = pb.MsgRoleBase()
			msgRoleBase.uid = 10086
			msgRoleBase.uname = 'mirahs'

			ackTestSendOk = pb.AckTestSendOk()
			ackTestSendOk.id_u8 = 255
			ackTestSendOk.role_base = msgRoleBase
			ackTestSendOk.id_f32 = [1.23,1.24]
			ackTestSendOk.id_op_u8 = 255
			ackTestSendOk.op_role_base = msgRoleBase
			self.send(ackTestSendOk.encode())



	def send(self, buff):
		self.__socket.send(buff)
