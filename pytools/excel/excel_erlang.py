#!/usr/bin/python
# coding:utf-8
from sys import path
path.append(r'../')

import types
from utils import tool


func_names = {
	'const':	'econst',
	'error':	'eerror',
}


def parse(data_path, common_path, val):
	key = val['key']
	if func_names.get(key):
		eval(func_names.get(key))(data_path, common_path, val)
	else:
		ecommon(data_path, common_path, val)


def ecommon(data_path, common_path, val):
	rem			= val['rem']
	key			= val['key']
	name		= val['name']
	
	key_fileds	= val['keys_erl']
	
	file_erl	= val['file_erl']
	
	value_erl	= val['value_erl']

	if file_erl:
		file_name	= data_path + file_erl

		str_head	= tool.get_head(key, key_fileds)
		str_head	+="%% " + ";\n%% ".join(rem) + "\n"

		erl_str	= list()
		erl_keys= list()

		for index in range(len(value_erl)):
			val_erl = value_erl[index]
			s = ''
			for k2, v2 in val_erl.items():
				if type(v2) is types.DictType:
					s += '\t\t' + k2.ljust(12, chr(32)) + ' = #' + str(k2) + '{'
					for ak, av in v2.items():
						s += ak + ' = ' + str(av) + ','
					idx = s.rfind(',')
					s   = s[:idx] + s[idx + 1:] + '},\n'
				else:
					# chr(32)返回一个空格的元字符
					cstr	= k2.ljust(12, chr(32)) + ' = ' + str(v2) + ','
					s += '\t\t' + cstr.ljust(32, chr(32)) + '% ' + name[k2] + '\n'

			idx = s.rfind(',')
			s   = s[:idx] + ' ' + s[idx + 1:]
			
			erl_str	= tool.get_erl_str_list(erl_str, val_erl, key_fileds, key, s)
			erl_keys= tool.get_erl_keys_list(erl_keys, val_erl, key_fileds)

		str_end = tool.get_end(len(key_fileds))
		erl_str.append(str_end)
		erl_str = ';\n'.join(erl_str)

		erl_keys_str	= ''
		if len(key_fileds) == 1:
			erl_keys	= [str(ik) for ik in erl_keys]
			erl_keys_str= '\n\nkeys() ->\n\t[' + ', '.join(erl_keys) + '].'
		
		erl_str += erl_keys_str

		fd		= open(file_name, 'w+')
		strxx	= str_head + erl_str
		fd.write(strxx.encode('utf-8'))
		fd.close()


def econst(data_path, common_path, val):
	rem			= val['rem']

	value_erl	= val['value_erl']

	file_const_erl   = common_path + 'const.define.hrl'

	str_head	= "%% " + ";\n%% ".join(rem) + "\n\n"

	erl_str     = ''
	for item in value_erl:
		if item['name'] != '':
			tmp_str = '-define(CONST_' + item['name'].upper() + ','
			tmp_str = tmp_str.ljust(40, chr(32)) + str(item['value']) + '). % ' +  item['rem'] + '\n'
			erl_str += tmp_str
		else:
			erl_str += '\n'

	fd		= open(file_const_erl, 'w+')
	strxx	= str_head + erl_str
	fd.write(strxx.encode('utf-8'))
	fd.close()


def eerror(data_path, common_path, val):
	rem			= val['rem']

	value_erl	= val['value_erl']

	file_error_erl   = common_path + 'const.error.hrl'

	str_head	= "%% " + ";\n%% ".join(rem) + "\n\n"

	erl_str     = ''
	for item in value_erl:
		if item['name'] != '':
			tmp_str = '-define(ERROR_' + item['name'].upper() + ','
			tmp_str = tmp_str.ljust(40, chr(32)) + str(item['code']) + '). % ' +  item['value'] + '\n'
			erl_str += tmp_str
		else:
			erl_str += '\n'

	fd		= open(file_error_erl, 'w+')
	strxx	= str_head + erl_str
	fd.write(strxx.encode('utf-8'))
	fd.close()
