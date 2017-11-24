#!/usr/bin/env python
# coding:utf-8
from utils import tool


lan_types = {
	'u8':       'uint8',
	'i8':       'int8',
	'u16':      'uint16',
	'i16':      'int16',
	'u32':      'uint32',
	'i32':      'int32',
	'u64':      'uint64',
	'i64':      'int64',
	'string':   'string',
	'f32':      'float32',
	'f64':      'float64',
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
	file_name		= code_path + 'protocol_code.go'

	_str_msg_head	= 'package proto\n\nconst (\n'
	_str_msg_end	= ')\n'
	_str_msg		= ''
	for mess_name_id in mess_name_ids:
		mess_name 	= mess_name_id['mess_name']
		if mess_name.startswith('S') or mess_name.startswith('C'):
			mess_id = mess_name_id['mess_id']
			mess_note = mess_name_id['mess_note']
			_str_msg += '\t// ' + mess_note + '\n\t' + tool.proto_name_msg(mess_name).ljust(30, chr(32)) + ' uint16 = ' + str(mess_id) + '\n\n'

	_str_msg = _str_msg_head + _str_msg[:-1] + _str_msg_end
	with open(file_name, 'w+') as fd:
		fd.write(_str_msg)


class ProtoGolang(object):
	def __init__(self, code_path, proto):
		proto_tmp				= trans_mess_type(proto)

		self._proto 			= proto_tmp

		self._code_path			= code_path
		self._mess_name 		= self._proto['mess_name']

		self._set_class_name()
		self._set_type_struct()
		self._set_proto_head()
		self._set_proto_encode()
		self._set_proto_decode()
		self._set_proto_set_get()

	def _set_class_name(self):
		self._str_class_name	= tool.proto_name_class(self._mess_name)
		self._str_class_name_var= self._str_class_name[:1].lower() + self._str_class_name[1:]


	def _set_type_struct(self):
		self._str_type_struct = 'type ' + self._str_class_name + ' struct {\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_name 		= mess_field['field_name']
			field_name_var	= tool.underline_to_camel(field_name)
			field_name_mem	= field_name_var[:1].lower() + field_name_var[1:]
			field_name_flag = field_name_mem + 'Flag'
			if 'required' == field_op:
				if field_type.startswith('Msg'):
					self._str_type_struct += '\t' + field_name_mem.ljust(25, chr(32)) + '*' + field_type + '\n'
				else:
					self._str_type_struct += '\t' + field_name_mem.ljust(25, chr(32)) + field_type + '\n'
			elif 'repeated' == field_op:
				if field_type.startswith('Msg'):
					self._str_type_struct += '\t' + field_name_mem.ljust(25, chr(32)) + '[]*' + field_type + '\n'
				else:
					self._str_type_struct += '\t' + field_name_mem.ljust(25, chr(32)) + '[]' + field_type + '\n'
			elif 'optional' == field_op:
				self._str_type_struct += '\t' + field_name_flag.ljust(25, chr(32)) + 'uint8\n'
				if field_type.startswith('Msg'):
					self._str_type_struct += '\t' + field_name_mem.ljust(25, chr(32)) + '*' + field_type + '\n'
				else:
					self._str_type_struct += '\t' + field_name_mem.ljust(25, chr(32)) + field_type + '\n'
		self._str_type_struct += '}\n'

	def _set_proto_head(self):
		self._str_head = 'package proto\n\nimport (\n\t"packet"\n)\n'

	def _set_proto_encode(self):
		self._str_encode = 'func (this *' + self._str_class_name + ') Encode() []byte {\n'
		self._str_encode += '\t' + 'pack := packet.NewWriteBuff(64)\n\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_type_func = field_type[:1].upper() + field_type[1:]
			field_name_var 	= tool.underline_to_camel(mess_field['field_name'])
			field_name_mem 	= field_name_var[:1].lower() + field_name_var[1:]
			field_name_flag = field_name_mem + 'Flag'
			field_name_count= field_name_mem + 'Count'
			if 'required' == field_op:
				if field_type.startswith('Msg'):
					self._str_encode += '\t' + 'pack.WriteBytes(this.' + field_name_mem + '.Encode())\n'
				else:
					self._str_encode += '\t' + 'pack.Write' + field_type_func + '(this.' + field_name_mem + ')\n'
			elif 'repeated' == field_op:
				self._str_encode += '\t' + field_name_count + ' := uint16(len(this.' + field_name_mem + '))\n'
				self._str_encode += '\t' + 'pack.WriteUint16(' + field_name_count + ')\n'
				self._str_encode += '\tfor i := uint16(0); i < ' + field_name_count + '; i++ {\n'
				if field_type.startswith('Msg'):
					self._str_encode += '\t\t' + 'pack.WriteBytes(this.' + field_name_mem + '[i].Encode())\n'
				else:
					self._str_encode += '\t\t' + 'pack.Write' + field_type_func + '(this.' + field_name_mem + '[i])\n'
				self._str_encode += '\t}\n'
			elif 'optional' == field_op:
				self._str_encode += '\t' + 'pack.WriteUint8(this.' + field_name_flag + ')\n'
				self._str_encode += '\tif this.' + field_name_flag + ' == 1 {\n'
				if field_type.startswith('Msg'):
					self._str_encode += '\t\t' + 'pack.WriteBytes(this.' + field_name_mem + '.Encode())\n'
				else:
					self._str_encode += '\t\t' + 'pack.Write' + field_type_func + '(this.' + field_name_mem + ')\n'
				self._str_encode += '\t}\n'

		if self._mess_name.startswith('Msg'):
			self._str_encode += '\n\treturn pack.ReadBytes()\n}\n'
		else:
			self._str_encode += '\n\treturn pack.Encode(' + tool.golang_proto_name_msg(self._mess_name) + ')\n}\n'

	def _set_proto_decode(self):
		self._str_decode = 'func ' + self._str_class_name + 'Decode(pack *packet.Packet) *' + self._str_class_name + ' {\n'
		self._str_decode +='\t' + self._str_class_name_var + ' := &' + self._str_class_name + '{}\n\n'
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_type_func = field_type[:1].upper() + field_type[1:]
			field_name_var 	= tool.underline_to_camel(mess_field['field_name'])
			field_name_mem 	= field_name_var[:1].lower() + field_name_var[1:]
			field_name_flag = field_name_mem + 'Flag'
			field_name_count= field_name_mem + 'Count'
			if 'required' == field_op:
				if field_type.startswith('Msg'):
					self._str_decode += '\t' + self._str_class_name_var + '.' + field_name_mem + ' = ' + field_type + 'Decode(pack)\n'
				else:
					self._str_decode += '\t' + self._str_class_name_var + '.' + field_name_mem + ' = pack.Read' + field_type_func + '()\n'
			elif 'repeated' == field_op:
				self._str_decode += '\t' + field_name_count + ' := pack.ReadUint16()\n'
				self._str_decode += '\tfor ;' + field_name_count + ' > 0; ' + field_name_count + '-- {\n'
				if field_type.startswith('Msg'):
					self._str_decode += '\t\t' + self._str_class_name_var + '.' + field_name_mem + ' = append(' + self._str_class_name_var + '.' + field_name_mem + ', ' + field_type + 'Decode(pack))\n'
				else:
					self._str_decode += '\t\t' + self._str_class_name_var + '.' + field_name_mem + ' = append(' + self._str_class_name_var + '.' + field_name_mem + ', ' + 'pack.Read' + field_type_func + '())\n'
				self._str_decode += '\t}\n'
			elif 'optional' == field_op:
				self._str_decode += '\t' + self._str_class_name_var + '.' + field_name_flag + ' = pack.ReadUint8()\n'
				self._str_decode += '\tif ' + self._str_class_name_var + '.' + field_name_flag + ' == 1 {\n'
				if field_type.startswith('Msg'):
					self._str_decode += '\t\t' + self._str_class_name_var + '.' + field_name_mem + ' = ' + field_type + 'Decode(pack)\n'
				else:
					self._str_decode += '\t\t' + self._str_class_name_var + '.' + field_name_mem + ' = pack.Read' + field_type_func + '()\n'
				self._str_decode += '\t}\n'
		self._str_decode += '\treturn ' + self._str_class_name_var + '\n}\n'

	def _set_proto_set_get(self):
		self._str_set 		= ''
		self._str_get 		= ''
		self._str_set_get	= ''
		for mess_field in self._proto['mess_fields']:
			field_op 		= mess_field['field_op']
			field_type 		= mess_field['field_type']
			field_name_big	= tool.underline_to_camel(mess_field['field_name'])
			field_name_mem 	= field_name_big[:1].lower() + field_name_big[1:]
			field_name_flag = field_name_mem + 'Flag'

			str_get = 'func (this *' + self._str_class_name + ') Get' + field_name_big + '() '
			str_set = 'func (this *' + self._str_class_name + ') Set' + field_name_big + '('
			if field_type.startswith('Msg'):
				if 'repeated' == field_op:
					str_get += '[]*' + field_type + ' {\n'
					str_set += field_name_mem + ' []*' + field_type + ') {\n'
				else:
					str_get += '*' + field_type + ' {\n'
					str_set += field_name_mem + ' *' + field_type + ') {\n'
			else:
				if 'repeated' == field_op:
					str_get += '[]' + field_type + ' {\n'
					str_set += field_name_mem + ' []' + field_type + ') {\n'
				else:
					str_get += field_type + ' {\n'
					str_set += field_name_mem + ' ' + field_type + ') {\n'

			str_get += '\treturn this.' + field_name_mem + '\n}\n'
			if 'optional' == field_op:
				str_set += '\tthis.' + field_name_flag + ' = 1\n'
			str_set += '\tthis.' + field_name_mem + ' = ' + field_name_mem + '\n}\n'

			self._str_set 		+= str_set + '\n'
			self._str_get 		+= str_get + '\n'
			self._str_set_get 	+= str_set + '\n' + str_get + '\n'

	def _do_msg(self):
		file_name = self._code_path + tool.camel_to_underline(self._mess_name) + '.go'

		str_content = self._str_head + '\n' + self._str_type_struct + '\n' + self._str_encode + '\n' + self._str_decode + '\n' + self._str_set_get

		with open(file_name, 'w+') as fd:
			fd.write(str_content[:-1])

	def do_client(self):
		if self._mess_name.startswith('C'):
			file_name = self._code_path + 'req_' + tool.camel_to_underline(self._mess_name[1:]) + '.go'

			str_content = self._str_head + '\n' + self._str_type_struct + '\n' + self._str_encode + '\n' + self._str_set

			with open(file_name, 'w+') as fd:
				fd.write(str_content[:-1])
		elif self._mess_name.startswith('S'):
			file_name = self._code_path + 'ack_' + tool.camel_to_underline(self._mess_name[1:]) + '.go'

			str_content = self._str_head + '\n' + self._str_type_struct + '\n' + self._str_decode + '\n' + self._str_get

			with open(file_name, 'w+') as fd:
				fd.write(str_content[:-1])
		else:
			self._do_msg()

	def do_server(self):
		if self._mess_name.startswith('C'):
			file_name = self._code_path + 'req_' + tool.camel_to_underline(self._mess_name[1:]) + '.go'

			str_content = self._str_head + '\n' + self._str_type_struct + '\n' + self._str_decode + '\n' + self._str_get

			with open(file_name, 'w+') as fd:
				fd.write(str_content[:-1])
		elif self._mess_name.startswith('S'):
			file_name = self._code_path + 'ack_' + tool.camel_to_underline(self._mess_name[1:]) + '.go'

			str_content = self._str_head + '\n' + self._str_type_struct + '\n' + self._str_encode + '\n' + self._str_set

			with open(file_name, 'w+') as fd:
				fd.write(str_content[:-1])
		else:
			self._do_msg()
