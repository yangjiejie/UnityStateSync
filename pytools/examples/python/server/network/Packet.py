#!/usr/bin/env python
# coding:utf-8

import struct


class Packet(object):
	__buffers	= ''

	def __init__(self, buffers=''):
		self.__buffers	= buffers


	def encode(self, packet_id):
		body_len	= len(self.__buffers)
		buffer_len	= struct.pack('>H', body_len + 2)
		buffer_pid	= struct.pack('>H', packet_id)

		return buffer_len + buffer_pid + self.read_bytes()

	def write_u8(self, val):
		self.__append('B', val)

	def write_i8(self, val):
		self.__append('b', val)

	def write_u16(self, val):
		self.__append('H', val)

	def write_i16(self, val):
		self.__append('h', val)

	def write_u32(self, val):
		self.__append('I', val)

	def write_i32(self, val):
		self.__append('i', val)

	def write_u64(self, val):
		self.__append('Q', val)

	def write_i64(self, val):
		self.__append('q', val)

	def write_f32(self, val):
		self.__append('f', val)

	def write_f64(self, val):
		self.__append('d', val)

	def write_string(self, val):
		str_len = len(val)
		self.write_u16(str_len)

		self.__append('%ss' % str_len, val)

	def write_bytes(self, val):
		str_len = len(val)

		self.__append('%ss' % str_len, val)

	def read_u8(self):
		return self.__substract('B', 1)

	def read_i8(self):
		return self.__substract('b', 1)

	def read_u16(self):
		return self.__substract('H', 2)

	def read_i16(self):
		return self.__substract('h', 2)

	def read_u32(self):
		return self.__substract('I', 4)

	def read_i32(self):
		return self.__substract('i', 4)

	def read_u64(self):
		return self.__substract('Q', 8)

	def read_i64(self):
		return self.__substract('q', 8)

	def read_f32(self):
		return self.__substract('f', 4)

	def read_f64(self):
		return self.__substract('d', 8)

	def read_string(self):
		str_len = self.read_u16()
		return self.__substract('%ss' % str_len, str_len)

	def read_bytes(self):
		return self.__buffers

	def __append(self, flag, val):
		tmp = struct.pack('>%s' % flag, val)
		self.__buffers += tmp

	def __substract(self, flag, reset_len):
		tmp_buffer = self.__buffers[:reset_len]
		val, = struct.unpack('>%s' % flag, tmp_buffer)
		self.__reset(reset_len)
		return val

	def __reset(self, size):
		self.__buffers = self.__buffers[size:]


if __name__ == '__main__':
	pass
