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
	return
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
	value_xml	= val['value_xml']

	file_const_cs = common_path + 'Const.cs'

	str_cs_head = 'using UnityEngine;\nusing System;\n\npublic class Const\n{\n'
	str_cs_end = '}\n'

	cs_str = ''
	for item in value_xml:
		if item['name'] != '':
			tmp_str = '\tpublic static uint ' + item['name'].upper()
			tmp_str = tmp_str.ljust(40, chr(32)) + ' = ' + str(item['value']) + '; // ' + item['rem'] + '\n'
			cs_str += tmp_str
		else:
			cs_str += '\n'

	fd = open(file_const_cs, 'w+')
	strxx = str_cs_head + cs_str + str_cs_end
	fd.write(strxx.encode('utf-8'))
	fd.close()


def eerror(data_path, common_path, val):
	value_xml	= val['value_xml']

	file_error_cs 		= common_path + 'Error.cs'
	file_error_data_cs	= common_path + 'ErrorData.cs'

	str_cs_head = 'using UnityEngine;\nusing System;\n\npublic class Error\n{\n'
	str_cs_end = '}\n'
	str_cs_data_head = 'using UnityEngine;\nusing System;\nusing System.Collections.Generic;\n\npublic class ErrorData\n{'
	str_cs_data_head += '\n\tpublic static ErrorData instance;\n'
	str_cs_data_head += '\n\tstatic ErrorData()\n\t{\n\t\tinstance = new ErrorData();\n\t}\n'
	str_cs_data_head += '\n\tpublic string getError(ushort key)\n\t{\n\t\treturn errorData[key];\n\t}\n'
	str_cs_data_head += '\n\tErrorData()\n\t{\n\t\tinitMember();\n\t}\n\n'
	str_cs_data_end = '}\n'

	cs_str = ''
	cs_data_str = '\tpublic static Dictionary<ushort, string> errorData = new Dictionary<ushort, string>();\n\n'
	cs_data_str += '\tprivate void initMember()\n\t{\n'
	for item in value_xml:
		if item['name'] != '':
			tmp_str = '\tpublic static ushort ' + item['name'].upper()
			tmp_str = tmp_str.ljust(40, chr(32)) + ' = ' + str(item['code']) + '; // ' + item['value'] + '\n'
			tmp_data_str = '\t\terrorData.Add(' + str(item['code']) + ', "' + item['value'] + '");\n'
			cs_str += tmp_str
			cs_data_str += tmp_data_str
		else:
			cs_str += '\n'
			cs_data_str += '\n'

	fd = open(file_error_cs, 'w+')
	strxx = str_cs_head + cs_str + str_cs_end
	fd.write(strxx.encode('utf-8'))
	fd.close()

	fd = open(file_error_data_cs, 'w+')
	strxx = str_cs_data_head + cs_data_str + '\t}\n' + str_cs_data_end
	fd.write(strxx.encode('utf-8'))
	fd.close()
