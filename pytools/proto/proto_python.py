#!/usr/bin/env python
# coding:utf-8
from sys import path
path.append(r'../')

from utils import tool


def protocol_const(code_path, mess_name_ids):
	file_name		= code_path + 'msg.py'

	_str_msg_head	= '#!/usr/bin/env python\n# coding:utf-8\n\n\n'
	_str_msg		= ''
	for mess_name_id in mess_name_ids:
		mess_name 	= mess_name_id['mess_name']
		mess_id 	= mess_name_id['mess_id']
		mess_note	= mess_name_id['mess_note']
		_str_msg += '# ' + mess_note + '\n' + tool.python_proto_name_msg(mess_name).ljust(40, chr(32)) + ' = ' + str(mess_id) + '\n\n'

	_str_msg = _str_msg_head + _str_msg[:-1]
	with open(file_name, 'w+') as fd:
		fd.write(_str_msg)


class ProtoPython(object):
	def __init__(self, proto):
		self._proto 			= proto

		self._mess_name 		= self._proto['mess_name']

		self._set_class_name()
		self._set_priv_var()
		self._set_encode()
		self._set_init()
		self._set_decode()
		self._set_set_get()
		self._set_get_bytes()

	def _set_class_name(self):
		self._str_msg_name 	= tool.python_proto_name_msg(self._mess_name)
		self._str_class_name= tool.python_class_name(self._mess_name)

	def _set_priv_var(self):
		self._str_priv_var = 'class ' + self._str_class_name + '(object):\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_name 		= mess_field['field_name']
			field_name_m	= '__' + field_name
			field_name_m_flag = field_name_m + '_flag'

			if field_op == 'optional':
				self._str_priv_var += '\t' + field_name_m_flag + ' = 0\n'
			default_value	= self.__set_default_value(field_op, field_type)
			self._str_priv_var += '\t' + field_name_m + ' = ' + default_value + '\n'

	def __set_default_value(self, field_op, field_type):
		if field_type == 'string':
			if field_op == 'repeated':
				return '[]'
			else:
				return "''"
		elif field_type.startswith('Msg'):
			if field_op == 'repeated':
				return '[]'
			else:
				return "None"
		else:
			if field_op == 'repeated':
				return '[]'
			else:
				return '0'

	def _set_encode(self):
		self._str_encode = '\tdef encode(self):\n\t\tpacket = Packet()\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_name 		= mess_field['field_name']
			field_name_flag	= 'self.__' + field_name + '_flag'
			field_name_count= field_name + '_count'
			field_name_m 	= 'self.__' + field_name
			if field_op == 'repeated':
				self._str_encode += '\t\t' + field_name_count + ' = len(' + field_name_m + ')\n'
				self._str_encode += '\t\tpacket.write_u16(' + field_name_count + ')\n'
				self._str_encode += '\t\tfor i in range(' + field_name_count + '):\n'
				# packet.write_f32(self.__id_f32[i])
				if field_type.startswith('Msg'):
					self._str_encode += '\t\t\tpacket.write_bytes(' + field_name_m + '[i].get_bytes())\n'
				else:
					self._str_encode += '\t\t\tpacket.write_' + field_type + '(' + field_name_m + '[i])\n'
			elif field_op == 'optional':
				self._str_encode += '\t\tpacket.write_u8(' + field_name_flag + ')\n'
				self._str_encode += '\t\tif ' + field_name_flag + ':\n'
				if field_type.startswith('M'):
					self._str_encode += '\t\t\tpacket.write_bytes(' + field_name_m + '.get_bytes())\n'
				else:
					self._str_encode += '\t\t\tpacket.write_' + field_type + '(' + field_name_m + ')\n'
			else:
				if field_type.startswith('M'):
					self._str_encode += '\t\tpacket.write_bytes(' + field_name_m + '.get_bytes())\n'
				else:
					self._str_encode += '\t\tpacket.write_' + field_type + '(' + field_name_m + ')\n'
		if self._mess_name.startswith('Msg'):
			self._str_encode += '\t\treturn packet.read_bytes()\n'
		else:
			self._str_encode += '\t\treturn packet.encode(' + 'msg.' + self._str_msg_name + ')\n'

	def _set_init(self):
		if self._mess_name.startswith('Msg'):
			self._str_init = '\tdef __init__(self, packet=None):\n\t\tif packet:\n\t\t\tself.decode(packet)\n'
		else:
			self._str_init = '\tdef __init__(self, packet):\n\t\tself.decode(packet)\n'

	def _set_decode(self):
		self._str_decode = '\tdef decode(self, packet):\n'
		if len(self._proto['mess_fields']) == 0:
			self._str_decode += '\t\tpass\n'
		else:
			for mess_field in self._proto['mess_fields']:
				field_op = mess_field['field_op']
				field_type = mess_field['field_type']
				field_name = mess_field['field_name']
				field_name_flag = 'self.__' + field_name + '_flag'
				field_name_count = field_name + '_count'
				field_name_m = 'self.__' + field_name
				if field_op == 'repeated':
					self._str_decode += '\t\t' + field_name_count + ' = packet.read_u16()\n'
					self._str_decode += '\t\tfor i in range(' + field_name_count + '):\n'
					if field_type.startswith('Msg'):
						self._str_decode += '\t\t\t' + field_name_m + '.append(' + field_type + '(packet))\n'
					else:
						self._str_decode += '\t\t\t' + field_name_m + '.append(packet.read_' + field_type + '())\n'
				elif field_op == 'optional':
					self._str_decode += '\t\t' + field_name_flag + ' = packet.read_u8()\n'
					self._str_decode += '\t\tif ' + field_name_flag + ':\n'
					if field_type.startswith('M'):
						self._str_decode += '\t\t\t' + field_name_m + ' = ' + field_type + '(packet)\n'
					else:
						self._str_decode += '\t\t\t' + field_name_m + ' = packet.read_' + field_type + '()\n'
				else:
					if field_type.startswith('M'):
						self._str_decode += '\t\t' + field_name_m + ' = ' + field_type + '(packet)\n'
					else:
						self._str_decode += '\t\t' + field_name_m + ' = packet.read_' + field_type + '()\n'

	def _set_set_get(self):
		self._str_set 		= ''
		self._str_get 		= ''
		self._str_set_get 	= ''
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_name 		= mess_field['field_name']
			field_name_flag = 'self.__' + field_name + '_flag'
			field_name_m 	= 'self.__' + field_name

			str_property	= ''
			str_set 		= ''
			str_get 		= ''

			str_property	+= '\t@property\n'
			str_property	+= '\tdef ' + field_name + '(self):\n'
			str_property	+= '\t\treturn ' + field_name_m + '\n'

			str_set			+= '\t@' + field_name + '.setter\n'
			str_set			+= '\tdef ' + field_name + '(self, value):\n'
			if field_op == 'optional':
				str_set		+= '\t\t' + field_name_flag + ' = 1\n'
			str_set			+= '\t\t' + field_name_m + ' = value\n'

			str_get			+= '\t@' + field_name + '.getter\n'
			str_get			+= '\tdef ' + field_name + '(self):\n'
			str_get			+= '\t\treturn ' + field_name_m + '\n'

			self._str_set 		+= str_property + str_set + '\n'
			self._str_get 		+= str_property + str_get + '\n'
			self._str_set_get 	+= str_property + str_set + str_get + '\n'

		self._str_set 		= self._str_set[:-1]
		self._str_get 		= self._str_get[:-1]
		self._str_set_get	= self._str_set_get[:-1]

	def _set_get_bytes(self):
		self._str_get_bytes = '\tdef get_bytes(self):\n\t\treturn self.encode()\n'

	def _do_msg(self):
		content 	= self._str_priv_var + '\n' + self._str_encode + '\n' + self._str_init + '\n' + self._str_decode + '\n' + self._str_get_bytes + '\n' + self._str_set_get

		return content

	def do_client(self):
		if self._mess_name.startswith('C'):
			content = self._str_priv_var + '\n' + self._str_encode + '\n' + self._str_set

			return content
		elif self._mess_name.startswith('S'):
			content = self._str_priv_var + '\n' + self._str_init + '\n' + self._str_decode + '\n' + self._str_get

			return content
		else:
			return self._do_msg()

	def do_server(self):
		if self._mess_name.startswith('C'):
			content = self._str_priv_var + '\n' + self._str_init + '\n' + self._str_decode + '\n' + self._str_get

			return content
		elif self._mess_name.startswith('S'):
			content = self._str_priv_var + '\n' + self._str_encode + '\n' + self._str_set

			return content
		else:
			return self._do_msg()
