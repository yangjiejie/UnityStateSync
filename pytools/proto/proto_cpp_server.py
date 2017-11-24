#!/usr/bin/env python
# coding:utf-8
from sys import path
path.append(r'../')

from proto_cpp import ProtoCpp, protocol_const, protocol_include


def parse(code_path, common_path, protos):
	name_ids	= list()
	for proto in protos:
		name_id	= dict()
		name_id['mess_name']	= proto['mess_name']
		name_id['mess_id'] 		= proto['mess_id']
		name_id['mess_note'] 	= proto['mess_note']
		name_ids.append(name_id)
		ProtoCpp(code_path, proto).do_server()

	protocol_const(code_path, name_ids)
	protocol_include(code_path, name_ids)
