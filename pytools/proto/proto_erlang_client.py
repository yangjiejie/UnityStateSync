#!/usr/bin/python
# coding:utf-8
from proto_erlang import ProtoErlang, protocol_const, protocol_record


def parse(code_path, common_path, protos):
    name_ids = list()
    for proto in protos:
        name_id = dict()
        name_id['mess_name']    = proto['mess_name']
        name_id['mess_id']      = proto['mess_id']
        name_id['mess_note']    = proto['mess_note']
        name_ids.append(name_id)

    protocol_const(common_path, name_ids)
    protocol_record(common_path, protos)

    parse_protos(code_path, protos)


def parse_protos(code_path, protos):
    _file_name  = code_path + 'pb.erl'
    _str_protos = '-module(pb).\n\n-include("common.hrl").\n\n-compile(export_all).\n\n\n'

    for proto in protos:
        _str_proto  = ProtoErlang(proto).do_client()
        _str_protos += _str_proto

    with open(_file_name, 'w+') as fd:
        fd.write(_str_protos[:-1])
