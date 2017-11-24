#!/usr/bin/env python
# coding:utf-8
from utils import tool


def protocol_const(code_path, mess_name_ids):
	file_name		= code_path + 'Msg.php'

	_str_msg_head	= '<?php\nnamespace protocol;\n\n\nclass Msg\n{\n'
	_str_msg_end	= '}\n'
	_str_msg_def	= 'public static '
	_str_msg		= ''
	for mess_name_id in mess_name_ids:
		mess_name 	= mess_name_id['mess_name']
		if mess_name.startswith('S') or mess_name.startswith('C'):
			mess_id 	= mess_name_id['mess_id']
			mess_note	= mess_name_id['mess_note']
			_str_msg	+= '\t// ' + mess_note + '\n\t' + (_str_msg_def + '$' + tool.proto_name_msg(mess_name)).ljust(50, chr(32)) + ' = ' + str(mess_id) + ';\n\n'

	_str_msg = _str_msg_head + _str_msg[:-1] + _str_msg_end
	with open(file_name, 'w+') as fd:
		fd.write(_str_msg)


class ProtoPhp(object):
	def __init__(self, code_path, proto):
		self._proto 			= proto

		self._code_path			= code_path
		self._mess_name 		= self._proto['mess_name']

		self._set_class_name()
		self._set_head()
		self._set_end()
		self._set_priv_var()
		self._set_encode()
		self._set_init()
		self._set_decode()
		self._set_set_get()
		self._set_get_bytes()

	def _set_class_name(self):
		self._str_msg_name 	= tool.proto_name_msg(self._mess_name)
		self._str_class_name= tool.proto_name_class(self._mess_name)
		self._filename		= self._code_path + self._str_class_name + '.php'

	def _set_head(self):
		self._str_head = '<?php\nnamespace protocol;\n\nuse network\Packet;\n'

	def _set_end(self):
		self._str_end = '}\n'

	def _set_priv_var(self):
		self._str_priv_var = 'class ' + self._str_class_name + '\n{\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_name 		= mess_field['field_name']
			field_name_camel= tool.underline_to_camel(field_name)
			field_name_var	= field_name_camel[:1].lower() + field_name_camel[1:]
			field_name_flag = field_name_var + 'Flag'

			if field_op == 'optional':
				self._str_priv_var += '\tprivate $' + field_name_flag + ' = 0;\n'

			default_value	= self.__set_default_value(field_op, field_type)

			self._str_priv_var += '\tprivate $' + field_name_var + ' = ' + default_value + ';\n'

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
				return "null"
		else:
			if field_op == 'repeated':
				return '[]'
			else:
				return '0'

	def _set_encode(self):
		self._str_encode = '\tpublic function encode()\n\t{\n\t\t$packet = new Packet();\n'
		for mess_field in self._proto['mess_fields']:
			field_op 			= mess_field['field_op']
			field_type 			= mess_field['field_type']
			field_type_big		= field_type.capitalize()
			field_name 			= mess_field['field_name']
			field_name_camel 	= tool.underline_to_camel(field_name)
			field_name_camel	= field_name_camel[:1].lower() + field_name_camel[1:]
			field_name_var 		= '$' + field_name_camel
			field_name_flag 	= '$this->' + field_name_camel + 'Flag'
			field_name_count	= '$' + field_name_camel + 'Count'
			field_name_this 	= '$this->' + field_name_camel
			if field_op == 'repeated':
				self._str_encode += '\t\t' + field_name_count + ' = count(' + field_name_this + ');\n'
				self._str_encode += '\t\t$packet->writeU16(' + field_name_count + ');\n'
				self._str_encode += '\t\tforeach (' + field_name_this + ' as ' + field_name_var + ')\n\t\t{\n'
				if field_type.startswith('Msg'):
					self._str_encode += '\t\t\t$packet->writeBytes(' + field_name_var + '->getBytes());\n\t\t}\n'
				else:
					self._str_encode += '\t\t\t$packet->write' + field_type_big + '(' + field_name_var + ');\n\t\t}\n'
			elif field_op == 'optional':
				self._str_encode += '\t\t$packet->writeU8(' + field_name_flag + ');\n'
				if field_type.startswith('M'):
					self._str_encode += '\t\tif (' + field_name_flag + ' == 1)\n\t\t{\n'
					self._str_encode += '\t\t\t$packet->writeBytes(' + field_name_this + '->getBytes());\n\t\t}\n'
				else:
					self._str_encode += '\t\tif (' + field_name_flag + ' == 1)\n\t\t{\n'
					self._str_encode += '\t\t\t$packet->write' + field_type_big + '(' + field_name_this + ');\n\t\t}\n'
			else:
				if field_type.startswith('M'):
					self._str_encode += '\t\t$packet->writeBytes(' + field_name_this + '->getBytes());\n'
				else:
					self._str_encode += '\t\t$packet->write' + field_type_big + '(' + field_name_this + ');\n'
		if self._mess_name.startswith('Msg'):
			self._str_encode += '\t\treturn $packet->readBytes();\n'
		else:
			self._str_encode += '\t\treturn $packet->encode(' + 'Msg::$' + self._str_msg_name + ');\n'
		self._str_encode += '\t}\n'

	def _set_init(self):
		if self._str_class_name.startswith('Msg'):
			self._str_init = '\tpublic function __construct(&$packet=null)\n\t{\n\t\tif ($packet)\n\t\t{\n\t\t\t$this->decode($packet);\n\t\t}\n\t}\n'
		else:
			self._str_init = '\tpublic function __construct(&$packet)\n\t{\n\t\t$this->decode($packet);\n\t}\n'

	def _set_decode(self):
		self._str_decode = '\tpublic function decode(&$packet)\n\t{\n'
		for mess_field in self._proto['mess_fields']:
			field_op 			= mess_field['field_op']
			field_type 			= mess_field['field_type']
			field_type_big 		= field_type.capitalize()
			field_name 			= mess_field['field_name']
			field_name_camel 	= tool.underline_to_camel(field_name)
			field_name_camel 	= field_name_camel[:1].lower() + field_name_camel[1:]
			field_name_flag 	= '$this->' + field_name_camel + 'Flag'
			field_name_count 	= '$' + field_name_camel + 'Count'
			field_name_this 	= '$this->' + field_name_camel
			if field_op == 'repeated':
				self._str_decode += '\t\t' + field_name_count + ' = $packet->readU16();\n'
				self._str_decode += '\t\tfor ($i = 0; $i < ' + field_name_count + '; $i++)\n\t\t{\n'
				if field_type.startswith('Msg'):
					self._str_decode += '\t\t\t' + 'array_push(' + field_name_this + ', new ' + field_type + '($packet));\n'
				else:
					self._str_decode += '\t\t\t' + 'array_push(' + field_name_this + ', $packet->read' + field_type_big + '());\n'
				self._str_decode += '\t\t}\n'
			elif field_op == 'optional':
				self._str_decode += '\t\t' + field_name_flag + ' = $packet->readU8();\n'
				self._str_decode += '\t\tif (' + field_name_flag + ' == 1)\n'
				self._str_decode += '\t\t{\n'
				if field_type.startswith('M'):
					self._str_decode += '\t\t\t' + field_name_this + ' = new ' + field_type + '($packet);\n'
				else:
					self._str_decode += '\t\t\t' + field_name_this + ' = ' + '$packet->read' + field_type_big + '();\n'
				self._str_decode += '\t\t}\n'
			else:
				if field_type.startswith('M'):
					self._str_decode += '\t\t' + field_name_this + ' = new ' + field_type + '($packet);\n'
				else:
					self._str_decode += '\t\t' + field_name_this + ' = $packet->read' + field_type_big + '();\n'
		self._str_decode += '\t}\n'

	def _set_set_get(self):
		self._str_set = ''
		self._str_get = ''
		self._str_set_get = ''
		for mess_field in self._proto['mess_fields']:
			field_op 			= mess_field['field_op']
			field_name 			= mess_field['field_name']
			field_name_camel 	= tool.underline_to_camel(field_name)
			field_name_upper	= field_name_camel
			field_name_camel 	= field_name_camel[:1].lower() + field_name_camel[1:]
			field_name_var 		= '$' + field_name_camel
			field_name_flag 	= '$this->' + field_name_camel + 'Flag'
			field_name_this 	= '$this->' + field_name_camel

			str_set = ''
			str_get = ''

			str_set += '\tpublic function set' + field_name_upper + '(' + field_name_var + ')\n\t{\n'
			if field_op == 'optional':
				str_set += '\t\t' + field_name_flag + ' = 1;\n'
			str_set += '\t\t'  + field_name_this + ' = ' + field_name_var + ';\n\t}\n'
			str_get += '\tpublic function get' + field_name_upper + '()\n\t{\n\t\treturn ' + field_name_this + ';\n\t}\n'

			self._str_set 		+= str_set + '\n'
			self._str_get 		+= str_get + '\n'
			self._str_set_get 	+= str_set + str_get + '\n'

		self._str_set = self._str_set[:-1]
		self._str_get = self._str_get[:-1]
		self._str_set_get = self._str_set_get[:-1]

	def _set_get_bytes(self):
		self._str_get_bytes = '\tpublic function getBytes()\n\t{\n\t\treturn $this->encode();\n\t}\n'

	def _do_msg(self):
		content 	= self._str_head + '\n\n' + self._str_priv_var + '\n\n' + self._str_init + '\n' + self._str_decode + '\n' + self._str_encode + '\n' + self._str_get_bytes + '\n\n' + self._str_set_get + '\n' + self._str_end

		with open(self._filename, 'w+') as fd:
			fd.write(content)

	def do_client(self):
		if self._mess_name.startswith('C'):
			content = self._str_head + '\n\n' + self._str_priv_var + '\n\n' + self._str_encode + '\n\n' + self._str_set + '\n' + self._str_end

			with open(self._filename, 'w+') as fd:
				fd.write(content)
		elif self._mess_name.startswith('S'):
			content = self._str_head + '\n\n' + self._str_priv_var + '\n\n' + self._str_init + '\n' + self._str_decode + '\n\n' + self._str_get + '\n' + self._str_end

			with open(self._filename, 'w+') as fd:
				fd.write(content)
		else:
			self._do_msg()

	def do_server(self):
		if self._mess_name.startswith('C'):
			content = self._str_head + '\n\n' + self._str_priv_var + '\n\n' + self._str_init + '\n' + self._str_decode + '\n\n' + self._str_get + '\n' + self._str_end

			with open(self._filename, 'w+') as fd:
				fd.write(content)
		elif self._mess_name.startswith('S'):
			content = self._str_head + '\n\n' + self._str_priv_var + '\n\n' + self._str_encode + '\n\n' + self._str_set + '\n' + self._str_end

			with open(self._filename, 'w+') as fd:
				fd.write(content)
		else:
			self._do_msg()
