#!/usr/bin/env python
# coding:utf-8
from utils import tool


lan_types = {
	'u8':       'U8',
	'i8':       'I8',
	'u16':      'U16',
	'i16':      'I16',
	'u32':      'U32',
	'i32':      'I32',
	'u64':      'U64',
	'i64':      'I64',
	'f32':      'F32',
	'f64':      'F64',
	'string':	'String',
}


# 类型转换
def trans_mess_type(mess_body):
	for idx in xrange(len(mess_body['mess_fields'])):
		mess_field = mess_body['mess_fields'][idx]
		if mess_field['field_op'] == 'required':
			if mess_field['field_type'] in lan_types:
				mess_field['field_type'] = lan_types[mess_field['field_type']]
		if mess_field['field_op'] == 'optional':
			if mess_field['field_type'] in lan_types:
				mess_field['field_type'] = lan_types[mess_field['field_type']]
		if mess_field['field_op'] == 'repeated':
			if mess_field['field_type'] in lan_types:
				mess_field['field_type'] = lan_types[mess_field['field_type']]

		mess_body['mess_fields'][idx] = mess_field

	return mess_body


def protocol_const(code_path, mess_name_ids):
	file_name		= code_path + 'Msg.hpp'

	_str_msg_head	= '#ifndef _MSG_\n#define _MSG_\n\n#include <pb_type.hpp>\n\n\nclass Msg\n{\npublic:\n'
	_str_msg_end	= '};\n\n#endif\n'
	_str_msg_def	= 'static const U16 '
	_str_msg		= ''
	for mess_name_id in mess_name_ids:
		mess_name 	= mess_name_id['mess_name']
		mess_id 	= mess_name_id['mess_id']
		mess_note	= mess_name_id['mess_note']
		_str_msg += '\t// ' + mess_note + '\n\t' + (_str_msg_def + tool.cpp_proto_name_msg(mess_name)).ljust(55, chr(32)) + ' = ' + str(mess_id) + ';\n'

	_str_msg = _str_msg_head + _str_msg + _str_msg_end
	with open(file_name, 'w+') as fd:
		fd.write(_str_msg)


def protocol_include(code_path, mess_name_ids):
	file_name		= code_path + 'pb.hpp'

	_str_include	= '#ifndef _PROTOCOLS_\n#define _PROTOCOLS_\n\n#include <list>\n\n#include <pb_type.hpp>\n#include <Packet.hpp>\n\n#include <Msg.hpp>\n\n'

	for mess_name_id in mess_name_ids:
		mess_name 	= mess_name_id['mess_name']

		_str_include	+= '#include <' + tool.cpp_class_name(mess_name) + '.cpp>\n'

	_str_msg = _str_include + '\n#endif\n'
	with open(file_name, 'w+') as fd:
		fd.write(_str_msg)


class ProtoCpp(object):
	def __init__(self, code_path, proto):
		proto_tmp = trans_mess_type(proto)

		self._proto 			= proto_tmp

		self._code_path			= code_path
		self._mess_name 		= self._proto['mess_name']

		self._set_class_name()
		self._set_head()
		self._set_head_include()
		self._set_end()
		self._set_priv_var()
		self._set_encode()
		self._set_decode()
		self._set_set_get()
		self._set_get_bytes()

	def _set_class_name(self):
		self._str_msg_name 	= tool.cpp_proto_name_msg(self._mess_name)
		self._str_class_name= tool.cpp_class_name(self._mess_name)
		self._filename		= self._code_path + self._str_class_name + '.cpp'

	def _set_head(self):
		str_def = '_' + tool.camel_to_underline(self._str_class_name).upper() + '_'
		self._str_head = '#ifndef ' + str_def + '\n' + '#define ' + str_def + '\n\n'
		self._str_head += '#include <list>\n\n#include <pb_type.hpp>\n#include <Packet.hpp>\n\n#include <Msg.hpp>\n'

	def _set_head_include(self):
		self._str_head_include = ''
		for mess_field in self._proto['mess_fields']:
			field_type = mess_field['field_type']
			if field_type.startswith('Msg'):
				self._str_head_include += '#include <' + field_type + '.cpp>\n'

	def _set_end(self):
		self._str_end = '};\n\n#endif\n'

	def _set_priv_var(self):
		self._str_priv_var = 'class ' + self._str_class_name + '\n{\nprivate:\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_name 		= mess_field['field_name']
			field_name_m	= 'm_' + field_name
			field_name_flag = field_name_m + '_flag'
			if field_op == 'repeated':
				if field_type.startswith('Msg'):
					self._str_priv_var += '\tlist<' + field_type + '*> ' + field_name_m + ';\n'
				else:
					self._str_priv_var += '\tlist<' + field_type + '> ' + field_name_m + ';\n'
			elif field_op == 'optional':
				self._str_priv_var += '\tU8 ' + field_name_flag + ';\n'
				if field_type.startswith('Msg'):
					self._str_priv_var += '\t' + field_type + '* ' + field_name_m + ';\n'
				else:
					self._str_priv_var += '\t' + field_type + ' ' + field_name_m + ';\n'
			else:
				if field_type.startswith('Msg'):
					self._str_priv_var += '\t' + field_type + '* ' + field_name_m + ';\n'
				else:
					self._str_priv_var += '\t' + field_type + ' ' + field_name_m + ';\n'

	def _set_encode(self):
		if self._mess_name.startswith('Msg'):
			self._str_encode = '\tBYTE* Encode(U32* len)\n\t{\n\t\tPacket packet;\n'
		else:
			self._str_encode = '\tPacket Encode()\n\t{\n\t\tPacket packet;\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_name 		= mess_field['field_name']
			field_name_m 	= 'm_' + field_name
			field_name_flag = field_name_m + '_flag'
			field_name_count= field_name + '_count'
			field_name_buff = field_name + '_buff'
			field_name_buff_len = field_name_buff + '_len'

			str_buff1		= '\t\tU32 ' + field_name_buff_len + ' = 0;\n'
			str_buff2		= '\t\tBYTE* ' + field_name_buff + ' = ' + field_name_m + '->GetBytes(&' + field_name_buff_len + ');\n'

			if field_op == 'repeated':
				self._str_encode += '\t\tU16 ' + field_name_count + ' = (U16)' + field_name_m + '.size();\n'
				self._str_encode += '\t\tpacket.WriteU16(' + field_name_count + ');\n'
				if field_type.startswith('Msg'):
					self._str_encode += '\t\tfor (list<' + field_type + '*>::iterator i = ' + field_name_m + '.begin(); ' + 'i != ' + field_name_m + '.end(); i++)\n\t\t{\n'
					self._str_encode += '\t' + str_buff1
					self._str_encode += '\t\t\t' + field_type + '* xx = (' + field_type + '*)*i;\n'
					self._str_encode += '\t\t\tBYTE* ' + field_name_buff + ' = xx->GetBytes(&' + field_name_buff_len + ');\n'
					self._str_encode += '\t\t\tpacket.WriteBytes(' + field_name_buff + ', ' + field_name_buff_len + ');\n\t\t}\n'
				else:
					self._str_encode += '\t\tfor (list<' + field_type + '>::iterator i = ' + field_name_m + '.begin(); ' + 'i != ' + field_name_m + '.end(); i++)\n\t\t{\n'
					self._str_encode += '\t\t\tpacket.Write' + field_type + '((' + field_type + ')*i);\n\t\t}\n'
			elif field_op == 'optional':
				self._str_encode += '\t\tpacket.WriteU8(' + field_name_flag + ');\n'
				self._str_encode += '\t\tif (' + field_name_flag + ' == 1)\n\t\t{\n'
				if field_type.startswith('M'):
					self._str_encode += '\t' + str_buff1 + '\t' + str_buff2
					self._str_encode += '\t\t\tpacket.WriteBytes(' + field_name_buff + ', ' + field_name_buff_len + ');\n'
				else:
					self._str_encode += '\t\t\tpacket.Write' + field_type + '(' + field_name_m + ');\n'
				self._str_encode += '\t\t}\n'
			else:
				if field_type.startswith('M'):
					self._str_encode += str_buff1 + str_buff2
					self._str_encode += '\t\tpacket.WriteBytes(' + field_name_buff + ', ' + field_name_buff_len + ');\n'
				else:
					self._str_encode += '\t\tpacket.Write' + field_type + '(' + field_name_m + ');\n'

		if self._mess_name.startswith('Msg'):
			self._str_encode += '\t\treturn packet.ReadBytes(len);\n'
		else:
			self._str_encode += '\t\tpacket.Encode(Msg::' + self._str_msg_name + ');\n'
			self._str_encode += '\t\treturn packet;\n'
		self._str_encode += '\t}\n'

	def _set_decode(self):
		self._str_decode = '\t' + self._str_class_name + '(Packet* packet)\n\t{\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_name 		= mess_field['field_name']
			field_name_m	= 'm_' + field_name
			field_name_flag	= field_name_m + '_flag'
			field_name_count= field_name + '_count'
			if field_op == 'repeated':
				self._str_decode += '\t\tU16 ' + field_name_count + ' = packet->ReadU16();\n'
				self._str_decode += '\t\tfor (U16 i = 0; i < ' + field_name_count + '; i++)\n\t\t{\n'
				if field_type.startswith('Msg'):
					self._str_decode += '\t\t\t' + field_name_m + '.push_back(new ' + field_type + '(packet));\n'
				else:
					self._str_decode += '\t\t\t' + field_name_m + '.push_back(packet->Read' + field_type + '());\n'
				self._str_decode += '\t\t}\n'
			elif field_op == 'optional':
				self._str_decode += '\t\t' + field_name_flag + ' = packet->ReadU8();\n'
				self._str_decode += '\t\tif (' + field_name_flag + ' == 1)\n'
				self._str_decode += '\t\t{\n'
				if field_type.startswith('M'):
					self._str_decode += '\t\t\t' + field_name_m + ' = new ' + field_type + '(packet);\n'
				else:
					self._str_decode += '\t\t\t' + field_name_m + ' = ' + 'packet->Read' + field_type + '();\n'
				self._str_decode += '\t\t}\n'
			else:
				if field_type.startswith('M'):
					self._str_decode += '\t\t' + field_name_m + ' = new ' + field_type + '(packet);\n'
				else:
					self._str_decode += '\t\t' + field_name_m + ' = packet->Read' + field_type + '();\n'
		self._str_decode += '\t}\n'

	def _set_set_get(self):
		self._str_set 		= ''
		self._str_get 		= ''
		self._str_set_get	= ''

		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_name 		= mess_field['field_name']
			field_name_big	= tool.underline_to_camel(field_name)
			field_name_m 	= 'm_' + field_name
			field_name_flag = field_name_m + '_flag'

			str_set 	= ''
			str_get 	= ''

			if field_op == 'repeated':
				if field_type.startswith('Msg'):
					str_set += '\tvoid Set' + field_name_big + '(list<' + field_type + '*> ' + field_name + ')\n\t{\n\t\t' + field_name_m + ' = ' + field_name + ';\n\t}\n'

					str_get += '\tlist<' + field_type + '*> Get' + field_name_big + '()\n\t{\n\t\treturn ' + field_name_m + ';\n\t}\n'
				else:
					str_set += '\tvoid Set' + field_name_big + '(list<' + field_type + '> ' + field_name + ')\n\t{\n\t\t' + field_name_m + ' = ' + field_name + ';\n\t}\n'

					str_get += '\tlist<' + field_type + '> Get' + field_name_big + '()\n\t{\n\t\treturn ' + field_name_m + ';\n\t}\n'
			elif field_op == 'optional':
				if field_type.startswith('Msg'):
					str_set += '\tvoid Set' + field_name_big + '(' + field_type + '* ' + field_name + ')\n\t{\n'

					str_get += '\t' + field_type + '* Get' + field_name_big + '()\n\t{\n\t\treturn ' + field_name_m + ';\n\t}\n'
				else:
					str_set += '\tvoid Set' + field_name_big + '(' + field_type + ' ' + field_name + ')\n\t{\n'

					str_get += '\t' + field_type + ' Get' + field_name_big + '()\n\t{\n\t\treturn ' + field_name_m + ';\n\t}\n'
				str_set += '\t\t' + field_name_flag + ' = 1;\n'
				str_set += '\t\t' + field_name_m + ' = ' + field_name + ';\n\t}\n'
			else:
				if field_type.startswith('Msg'):
					str_set += '\tvoid Set' + field_name_big + '(' + field_type + '* ' + field_name + ')\n\t{\n\t\t' + field_name_m + ' = ' + field_name + ';\n\t}\n'

					str_get += '\t' + field_type + '* Get' + field_name_big + '()\n\t{\n\t\treturn ' + field_name_m + ';\n\t}\n'
				else:
					str_set += '\tvoid Set' + field_name_big + '(' + field_type + ' ' + field_name + ')\n\t{\n\t\t' + field_name_m + ' = ' + field_name + ';\n\t}\n'

					str_get += '\t' + field_type + ' Get' + field_name_big + '()\n\t{\n\t\treturn ' + field_name_m + ';\n\t}\n'

			self._str_set 		+= str_set + '\n'
			self._str_get 		+= str_get + '\n'
			self._str_set_get 	+= str_set + str_get + '\n'

	def _set_get_bytes(self):
		self._str_get_bytes = '\tBYTE* GetBytes(U32* len)\n\t{\n\t\treturn Encode(len);\n\t}\n'

	def _do_msg(self):
		null_decode = '\t' + self._str_class_name + '()\n\t{\n\n\t}\n'
		content 	= self._str_head + '\n' + self._str_head_include + '\n\n' + self._str_priv_var + '\n\n' + 'public:\n' + self._str_encode + '\n' + null_decode + '\n' + self._str_decode + '\n' + self._str_get_bytes + '\n\n' + self._str_set_get + self._str_end

		with open(self._filename, 'w+') as fd:
			fd.write(content)

	def do_client(self):
		if self._mess_name.startswith('C'):
			content = self._str_head + '\n' + self._str_head_include + '\n\n' + self._str_priv_var + '\n\n' + 'public:\n' + self._str_encode + '\n\n' + self._str_set + self._str_end

			with open(self._filename, 'w+') as fd:
				fd.write(content)
		elif self._mess_name.startswith('S'):
			content = self._str_head + '\n' + self._str_head_include + '\n\n' + self._str_priv_var + '\n\n' + 'public:\n' + self._str_decode + '\n\n' + self._str_get + self._str_end

			with open(self._filename, 'w+') as fd:
				fd.write(content)
		else:
			self._do_msg()

	def do_server(self):
		if self._mess_name.startswith('C'):
			content = self._str_head + '\n' + self._str_head_include + '\n\n' + self._str_priv_var + '\n\n' + 'public:\n' + self._str_decode + '\n\n' + self._str_get + self._str_end

			with open(self._filename, 'w+') as fd:
				fd.write(content)
		elif self._mess_name.startswith('S'):
			content = self._str_head + '\n' + self._str_head_include + '\n\n' + self._str_priv_var + '\n\n' + 'public:\n' + self._str_encode + '\n\n' + self._str_set + self._str_end

			with open(self._filename, 'w+') as fd:
				fd.write(content)
		else:
			self._do_msg()
