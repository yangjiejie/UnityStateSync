#!/usr/bin/env python
# coding:utf-8
from utils import tool


lan_types = {
	'u8':       ('byte', 'int'),
	'i8':       'byte',
	'u16':      ('short', 'int'),
	'i16':      'short',
	'u32':      ('int', 'long'),
	'i32':      'int',
	'u64':      'long',
	'i64':      'long',
	'string':   'String',
	'f32':      'float',
	'f64':      'double',
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
	file_name		= code_path + 'Msg.java'

	_str_msg_head	= 'package protocol;\n\n\npublic class Msg\n{\n'
	_str_msg_end	= '}\n'
	_str_msg_def	= 'public static final int '
	_str_msg		= ''
	for mess_name_id in mess_name_ids:
		mess_name 	= mess_name_id['mess_name']
		mess_id 	= mess_name_id['mess_id']
		mess_note	= mess_name_id['mess_note']
		# _str_msg += '\t// ' + mess_note + '\n\t' + (_str_msg_def + tool.java_proto_name_msg(mess_name)).ljust(55, chr(32)) + ' = (short)' + str(mess_id) + ';\n\n'
		_str_msg	+= '\t' + (_str_msg_def + tool.java_proto_name_msg(mess_name)).ljust(55, chr(32)) + ' = ' + str(mess_id) + ';\n\n'

	_str_msg = _str_msg_head + _str_msg[:-1] + _str_msg_end
	with open(file_name, 'w+') as fd:
		fd.write(_str_msg)


class ProtoJava(object):
	def __init__(self, code_path, proto):
		proto_tmp = trans_mess_type(proto)

		self._proto 			= proto_tmp

		self._code_path			= code_path
		self._mess_name 		= self._proto['mess_name']

		self._set_class_name()
		self._set_head()
		self._set_end()
		self._set_priv_var()
		self._set_encode()
		self._set_decode()
		self._set_set_get()
		self._set_get_bytes()

	def _set_class_name(self):
		self._str_msg_name 	= tool.java_proto_name_msg(self._mess_name)
		self._str_class_name= tool.java_class_name(self._mess_name)

	def _set_head(self):
		self._str_head = 'package protocol;\n\n\nimport network.Packet;\nimport network.PacketUtil;\n\nimport java.util.List;\nimport java.util.ArrayList;\n'

	def _set_end(self):
		self._str_end = '}\n'

	def _set_priv_var(self):
		self._str_priv_var = 'public class ' + self._str_class_name + '\n{\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			if not isinstance(field_type, basestring):
				field_type	= mess_field['field_type'][0]
			field_type_big 	= field_type.capitalize()
			field_name 		= mess_field['field_name']
			if field_op == 'repeated':
				self._str_priv_var += '\tprivate List<' + field_type_big + '> ' + field_name + ' = new ArrayList<' + field_type_big+ '>();\n'
			elif field_op == 'optional':
				self._str_priv_var += '\tprivate byte ' + field_name + '_flag' + ';\n'
				self._str_priv_var += '\tprivate ' + field_type + ' ' + field_name + ';\n'
			else:
				self._str_priv_var += '\tprivate ' + field_type + ' ' + field_name + ';\n'

	def _set_encode(self):
		self._str_encode = '\tpublic byte[] encode()\n\t{\n\t\tPacket packet = new Packet();\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			if not isinstance(field_type, basestring):
				field_type 	= mess_field['field_type'][0]
			field_type_big 	= field_type.capitalize()
			field_name 		= mess_field['field_name']
			field_name_flag	= field_name + '_flag'
			field_name_count= field_name + '_count'
			if field_op == 'repeated':
				self._str_encode += '\t\tint ' + field_name_count + ' = ' + field_name + '.size();\n'
				self._str_encode += '\t\tpacket.writeShort((short)' + field_name_count + ');\n'
				self._str_encode += '\t\tfor (int i = 0; i < ' + field_name_count + '; i++)\n\t\t{\n'
				if field_type.startswith('Msg'):
					self._str_encode += '\t\t\tpacket.writeBytes(' + field_name + '.get(i).getBytes());\n\t\t}\n'
				else:
					self._str_encode += '\t\t\tpacket.write' + field_type_big + '((' + field_type + ')' + field_name + '.get(i));\n\t\t}\n'
			elif field_op == 'optional':
				self._str_encode += '\t\tpacket.writeByte(' + field_name_flag + ');\n'
				if field_type.startswith('M'):
					self._str_encode += '\t\tif (' + field_name_flag + ' == 1)\n\t\t{\n'
					self._str_encode += '\t\t\tpacket.writeBytes(' + field_name + '.getBytes());\n\t\t}\n'
				else:
					self._str_encode += '\t\tif (' + field_name_flag + ' == 1)\n\t\t{\n'
					self._str_encode += '\t\t\tpacket.write' + field_type_big + '(' + field_name + ');\n\t\t}\n'
			else:
				if field_type.startswith('M'):
					self._str_encode += '\t\tpacket.writeBytes(' + field_name + '.getBytes());\n'
				else:
					self._str_encode += '\t\tpacket.write' + field_type_big + '(' + field_name + ');\n'
		if self._mess_name.startswith('Msg'):
			self._str_encode += '\t\treturn packet.readBytes();\n'
		else:
			self._str_encode += '\t\treturn packet.encode(' + '(short)Msg.' + self._str_msg_name + ');\n'
		self._str_encode += '\t}\n'

	def _set_decode(self):
		self._str_decode = '\tpublic ' + self._str_class_name + '(Packet packet)\n\t{\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			if not isinstance(field_type, basestring):
				field_type 	= mess_field['field_type'][0]
			field_type_big 	= field_type.capitalize()
			field_name 		= mess_field['field_name']
			field_name_flag	= field_name + '_flag'
			field_name_count= field_name + '_count'
			if field_op == 'repeated':
				self._str_decode += '\t\tint ' + field_name_count + ' = PacketUtil.readUShort(packet.readShort());\n'
				self._str_decode += '\t\tfor (int i = 0; i < ' + field_name_count + '; i++)\n\t\t{\n'
				if field_type.startswith('Msg'):
					self._str_decode += '\t\t\t' + field_name + '.add(new ' + field_type + '(packet));\n'
				else:
					self._str_decode += '\t\t\t' + field_name + '.add(packet.read' + field_type_big + '());\n'
				self._str_decode += '\t\t}\n'
			elif field_op == 'optional':
				self._str_decode += '\t\t' + field_name_flag + ' = packet.readByte();\n'
				self._str_decode += '\t\tif (' + field_name_flag + ' == 1)\n'
				self._str_decode += '\t\t{\n'
				if field_type.startswith('M'):
					self._str_decode += '\t\t\t' + field_name + ' = new ' + field_type + '(packet);\n'
				else:
					self._str_decode += '\t\t\t' + field_name + ' = ' + 'packet.read' + field_type_big + '();\n'
				self._str_decode += '\t\t}\n'
			else:
				if field_type.startswith('M'):
					self._str_decode += '\t\t' + field_name + ' = new ' + field_type + '(packet);\n'
				else:
					self._str_decode += '\t\t' + field_name + ' = packet.read' + field_type_big + '();\n'
		self._str_decode += '\t}\n'

	def _set_set_get(self):
		self._str_set 		= ''
		self._str_get 		= ''
		self._str_set_get 	= ''
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_type_real	= field_type
			is_real			= True
			if not isinstance(field_type, basestring):
				field_type_real			= mess_field['field_type'][0]
				field_type_return		= mess_field['field_type'][1]
				field_type_return_big 	= field_type_return.capitalize()
				is_real					= False
			field_type_big 	= field_type_real.capitalize()
			if not isinstance(field_type, basestring):
				field_type 	= mess_field['field_type'][0]
			field_name 		= mess_field['field_name']
			field_name_flag = field_name + '_flag'
			field_name_func	= tool.underline_to_camel(field_name)

			str_set = ''
			str_get = ''

			if field_op == 'repeated':
				str_set += '\tpublic void set' + field_name_func + '(List<' + field_type_big + '> ' + field_name + ')\n\t{\n\t\tthis.' + field_name + ' = ' + field_name + ';\n\t}\n'

				str_get += '\tpublic List<' + field_type_big + '> get' + field_name_func + '()\n\t{\n\t\treturn this.' + field_name + ';\n\t}\n'
			elif field_op == 'optional':
				str_set += '\tpublic void set' + field_name_func + '(' + field_type + ' ' + field_name + ')\n\t{\n'
				str_set += '\t\tthis.' + field_name_flag + ' = (byte)1;\n'
				str_set += '\t\tthis.' + field_name + ' = ' + field_name + ';\n\t}\n'

				if is_real:
					str_get += '\tpublic ' + field_type_real + ' get' + field_name_func + '()\n\t{\n\t\treturn this.' + field_name + ';\n\t}\n'
				else:
					str_get += '\tpublic ' + field_type_return + ' get' + field_name_func + '()\n\t{\n'
					str_get += '\t\treturn PacketUtil.readU' + field_type_big + '(this.' + field_name + ');\n\t}\n'
			else:
				str_set += '\tpublic void set' + field_name_func + '(' + field_type + ' ' + field_name + ')\n\t{\n\t\tthis.' + field_name + ' = ' + field_name + ';\n\t}\n'

				if is_real:
					str_get += '\tpublic ' + field_type_real + ' get' + field_name_func + '()\n\t{\n\t\treturn this.' + field_name + ';\n\t}\n'
				else:
					str_get += '\tpublic ' + field_type_return + ' get' + field_name_func + '()\n\t{\n'
					str_get += '\t\treturn PacketUtil.readU' + field_type_big + '(this.' + field_name + ');\n\t}\n'

			self._str_set 		+= '\n' + str_set
			self._str_get 		+= '\n' + str_get
			self._str_set_get 	+= '\n' + str_set + str_get

	def _set_get_bytes(self):
		self._str_get_bytes = '\tpublic byte[] getBytes()\n\t{\n\t\treturn this.encode();\n\t}\n'

	def _do_msg(self):
		file_name 	= self._code_path + self._str_class_name + '.java'

		null_decode = '\tpublic ' + self._str_class_name + '()\n\t{\n\n\t}\n'

		content 	= self._str_head + '\n\n' + self._str_priv_var + '\n\n' + null_decode + '\n' + self._str_decode + '\n' + self._str_encode + '\n' + self._str_get_bytes + '\n\n' + self._str_set_get + '\n' + self._str_end

		with open(file_name, 'w+') as fd:
			fd.write(content)

	def do_client(self):
		if self._mess_name.startswith('C'):
			file_name 	= self._code_path + self._str_class_name + '.java'

			content = self._str_head + '\n\n' + self._str_priv_var + '\n\n' + self._str_encode + '\n\n' + self._str_set + '\n' + self._str_end

			with open(file_name, 'w+') as fd:
				fd.write(content)
		elif self._mess_name.startswith('S'):
			file_name 	= self._code_path + self._str_class_name + '.java'

			content = self._str_head + '\n\n' + self._str_priv_var + '\n\n' + self._str_decode + '\n\n' + self._str_get + '\n' + self._str_end

			with open(file_name, 'w+') as fd:
				fd.write(content)
		else:
			self._do_msg()

	def do_server(self):
		if self._mess_name.startswith('C'):
			file_name = self._code_path + self._str_class_name + '.java'

			content = self._str_head + '\n\n' + self._str_priv_var + '\n\n' + self._str_decode + '\n\n' + self._str_get + '\n' + self._str_end

			with open(file_name, 'w+') as fd:
				fd.write(content)
		elif self._mess_name.startswith('S'):
			file_name = self._code_path + self._str_class_name + '.java'

			content = self._str_head + '\n\n' + self._str_priv_var + '\n\n' + self._str_encode + '\n\n' + self._str_set + '\n' + self._str_end

			with open(file_name, 'w+') as fd:
				fd.write(content)
		else:
			self._do_msg()
