#!/usr/bin/env python
# coding:utf-8
from sys import path
path.append(r'../')

from proto_csharp import ProtoCsharp, protocol_const


def parse(code_path, common_path, protos):
	name_ids	= list()
	for proto in protos:
		name_id	= dict()
		name_id['mess_name']	= proto['mess_name']
		name_id['mess_id'] 		= proto['mess_id']
		name_id['mess_note'] 	= proto['mess_note']
		name_ids.append(name_id)
		ProtoCsharp(code_path, proto).do_client()

	protocol_const(code_path, name_ids)
	protocol_p2p(code_path, name_ids)


def protocol_p2p(code_path, mess_name_ids):
	file_name   = code_path + 'P2P.cs'
	_str_head   = 'public class P2P\n{\n\tpublic static System.Object PacketToProtocol(ushort packetId, Packet packet)\n\t{\n\t\tswitch (packetId)\n\t\t{'
	_str_end    = '\n\t\t}\n\n\t\treturn null;\n\t}\n}\n'

	_str_switch = ''
	for mess_name_id in mess_name_ids:
		if mess_name_id['mess_name'].startswith('S'):
			mess_name   = 'Ack' + mess_name_id['mess_name'][1:]
			var_name    = 'ack' + mess_name_id['mess_name'][1:]
			mess_id		= mess_name_id['mess_id']
			_str_switch += '\n\t\t\tcase ' + mess_id + ':\n\t\t\t\t' + mess_name + ' ' + var_name + ' = new ' + mess_name + '(packet);\n\t\t\t\treturn ' + var_name + ';'

	_str_content = _str_head + _str_switch + _str_end
	with open(file_name, 'w+') as fd:
		fd.write(_str_content)
