#!/usr/bin/env python
# coding:utf-8
from sys import path
path.append(r'../')

from proto_python import ProtoPython, protocol_const


def parse(code_path, common_path, protos):
	name_ids	= list()
	for proto in protos:
		name_id	= dict()
		name_id['mess_name']	= proto['mess_name']
		name_id['mess_id'] 		= proto['mess_id']
		name_id['mess_note'] 	= proto['mess_note']
		name_ids.append(name_id)

	protocol_const(code_path, name_ids)

	parse_protos(code_path, protos)


def parse_protos(code_path, protos):
	_file_name = code_path + 'pb.py'
	_str_protos = '#!/usr/bin/env python\n# coding:utf-8\nfrom sys import path\npath.append(r\'../\')\n\nfrom network.Packet import Packet\nimport msg\n\n\n'

	for proto in protos:
		_str_proto = ProtoPython(proto).do_server()
		_str_protos += _str_proto + '\n\n'

	_str_protos = _str_protos[:-2]

	with open(_file_name, 'w+') as fd:
		fd.write(_str_protos)
