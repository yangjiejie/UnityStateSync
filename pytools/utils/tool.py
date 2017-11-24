#!/usr/bin/python
# coding:utf-8
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import string
import types
import re


def proto_name_msg(mess_name):
	under_upper_mess_name	= camel_to_underline(mess_name[1:]).upper()
	if mess_name.startswith('C'):
		return 'P_REQ_' + under_upper_mess_name
	elif mess_name.startswith('S'):
		return 'P_ACK_' + under_upper_mess_name
	else:
		return 'P_' + camel_to_underline(mess_name).upper()


def proto_name_class(mess_name):
	if mess_name.startswith('C'):
		return 'Req' + mess_name[1:]
	elif mess_name.startswith('S'):
		return 'Ack' + mess_name[1:]
	else:
		return mess_name


def csharp_proto_name_msg(mess_name):
	under_upper_mess_name	= camel_to_underline(mess_name[1:]).upper()
	if mess_name.startswith('C'):
		return 'P_REQ_' + under_upper_mess_name
	elif mess_name.startswith('S'):
		return 'P_ACK_' + under_upper_mess_name
	else:
		return 'P_' + camel_to_underline(mess_name).upper()


def csharp_class_name(mess_name):
	if mess_name.startswith('C'):
		return 'Req' + mess_name[1:]
	elif mess_name.startswith('S'):
		return 'Ack' + mess_name[1:]
	else:
		return mess_name


def cpp_proto_name_msg(mess_name):
	under_upper_mess_name	= camel_to_underline(mess_name[1:]).upper()
	if mess_name.startswith('C'):
		return 'P_REQ_' + under_upper_mess_name
	elif mess_name.startswith('S'):
		return 'P_ACK_' + under_upper_mess_name
	else:
		return 'P_' + camel_to_underline(mess_name).upper()


def cpp_class_name(mess_name):
	if mess_name.startswith('C'):
		return 'Req' + mess_name[1:]
	elif mess_name.startswith('S'):
		return 'Ack' + mess_name[1:]
	else:
		return mess_name


def golang_proto_name_msg(mess_name):
	under_upper_mess_name	= camel_to_underline(mess_name[1:]).upper()
	if mess_name.startswith('C'):
		return 'P_REQ_' + under_upper_mess_name
	elif mess_name.startswith('S'):
		return 'P_ACK_' + under_upper_mess_name
	else:
		return 'P_' + camel_to_underline(mess_name).upper()


def lua_proto_name_msg(mess_name):
	under_upper_mess_name	= camel_to_underline(mess_name[1:]).upper()
	if mess_name.startswith('C'):
		return 'P_REQ_' + under_upper_mess_name
	elif mess_name.startswith('S'):
		return 'P_ACK_' + under_upper_mess_name
	else:
		return 'P_' + camel_to_underline(mess_name).upper()


def lua_class_name(mess_name):
	if mess_name.startswith('C'):
		return 'Req' + mess_name[1:]
	elif mess_name.startswith('S'):
		return 'Ack' + mess_name[1:]
	else:
		return mess_name


def java_proto_name_msg(mess_name):
	under_upper_mess_name	= camel_to_underline(mess_name[1:]).upper()
	if mess_name.startswith('C'):
		return 'P_REQ_' + under_upper_mess_name
	elif mess_name.startswith('S'):
		return 'P_ACK_' + under_upper_mess_name
	else:
		return 'P_' + camel_to_underline(mess_name).upper()


def java_class_name(mess_name):
	if mess_name.startswith('C'):
		return 'Req' + mess_name[1:]
	elif mess_name.startswith('S'):
		return 'Ack' + mess_name[1:]
	else:
		return mess_name


def python_proto_name_msg(mess_name):
	under_upper_mess_name	= camel_to_underline(mess_name[1:]).upper()
	if mess_name.startswith('C'):
		return 'P_REQ_' + under_upper_mess_name
	elif mess_name.startswith('S'):
		return 'P_ACK_' + under_upper_mess_name
	else:
		return 'P_' + camel_to_underline(mess_name).upper()


def python_class_name(mess_name):
	if mess_name.startswith('C'):
		return 'Req' + mess_name[1:]
	elif mess_name.startswith('S'):
		return 'Ack' + mess_name[1:]
	else:
		return mess_name


def get_head(key, key_fileds):
	str_head	= "-module(data_" + key + ").\n\n"
	str_head	+= "-include(\"common.hrl\").\n\n"
	field_len	= len(key_fileds)
	if field_len == 1:
		str_head	+= "-export([get/1, keys/0]).\n\n"
	else:
		str_head	+= "-export([get/" + str(field_len) + "]).\n\n"

	return str_head


def get_erl_str_list(erl_str_list, val_erl, key_fields, key, s):
	keys_str= ""
	for idx in range(len(key_fields)):
		field_erl = key_fields[idx]
		keys_str += str(val_erl[field_erl]) + ', '
	
	keys_str= keys_str[:-2]
	s1		= "get(" + keys_str + ") ->\n\t#d_" + key + "{\n" + s + "\t}"
	erl_str_list.append(s1)
	
	return erl_str_list


def get_erl_keys_list(erl_keys_list, val_erl, key_fileds):
	if len(key_fileds) == 1:
		erl_keys_list.append(val_erl[ key_fileds[0] ])
	
	return erl_keys_list


def get_end(field_len):
	str_end	= ""
	for x in range(field_len):
		str_end += "_, "
		
	str_end = str_end[:-2]
	str_end = "get(" + str_end + ") ->\n\t?null."
	
	return str_end


# str2list('[{1001,10},{1002,20}]', r'{(\d+),(\d+)}', 'id,count')
def str2list(mystrtmp, pattern, fieldstr):
	mystr	= mystrtmp.replace(' ', '')
	p		= re.compile(pattern)
	matchs	= p.findall(mystr)
	fields	= fieldstr.split(',')
	
	mylist	= list()
	for idx in range(len(matchs)):
		match	= matchs[idx]
		mydict	= dict()
		for idx_f in range(len(fields)):
			if match[idx_f]:
				key = fields[idx_f]
				mydict[key] = match[idx_f]
		mylist.append(mydict)
	return mylist


def camel_to_underline(camel_format):
	underline_format	= ''
	if isinstance(camel_format, str):
		for _s_ in camel_format:
			underline_format += _s_ if _s_.islower() else '_' + _s_.lower()
	if underline_format.startswith('_'):
		return underline_format[1:]
	return underline_format


def underline_to_camel(underline_format):
	camel_format	= ''
	if isinstance(underline_format, str):
		for _s_ in underline_format.split('_'):
			camel_format += _s_.capitalize()
			
	return camel_format


def intotrim(v):
	if type(v) is types.FloatType:
		v = int(v)
	elif type(v) is types.IntType:
		pass
	else:
		v = string.strip(v)

	return v
	
	
def to_xml(key, rows):
	str_xml	= '<?xml version="1.0" encoding="utf-8"?>\n<' + key + 's>'
	for idx in range(len(rows)):
		row = rows[idx]
		str_row_head	= '\t<' + key + ' '
		str_row_no_lod	= ''
		str_row			= ''
		has_lod			= False
		for k, v in row.items():
			if type(v) is types.FloatType or type(v) is types.IntType or type(v) is types.StringType:
				str_row_no_lod	+= k + '=' + '"' + str(v) + '" '
			elif type(v) is types.DictType:
				has_lod		= True
				str_tmp_head= '\n\t\t<' + k + ' '
				str_tmp_end	= '/>'
				str_row1	= ''
				for k1, v1 in v.items():
					str_row1	+= k1 + '=' + '"' + str(v1) + '" '
				str_row		+= str_tmp_head + str_row1 + str_tmp_end
			elif type(v) is types.ListType:
				has_lod		= True
				str_tmp_head= '<' + k + 's>'
				str_tmp_end	= '</' + k + 's>'
				str_row1	= ''
				for idxw in range(len(v)):
					roww	= v[idxw]
					str_row11	= '\n\t\t\t<' + k
					for k1, v1 in roww.items():
						str_row11 += ' ' + k1 + '=' + '"' + str(v1) + '" '
					str_row1 += str_row11 + '/>'
						
				str_row += '\n\t\t' + str_tmp_head + str_row1 + '\n\t\t' + str_tmp_end
			elif type(v) is types.UnicodeType:
				str_row_no_lod += k + '=' + str(v) + ' '
				
				
				
		if has_lod:
			str_row	= str_row_head + str_row_no_lod[:-1]  + '>' + str_row + '\n\t</' + key + '>'
		else:
			str_row	= str_row_head + str_row_no_lod + '/>'
		str_xml += '\n' + str_row
		
	str_xml += '\n' + '</' + key + 's>'
		
	return str_xml
	
	
def test_to_xml():
	xml_l = [
			{ "id": 1, "lv": 10, "attr": {"hp": 100, "magic": 100}, "currency": [{"type": 1, "value": 100}, {"type": 2, "value": 200}] },
			{ "id": 2, "lv": 20, "attr": {"hp": 200, "magic": 200}, "currency": [{"type": 1, "value": 100}, {"type": 2, "value": 200}] },
			{ "id": 3, "lv": 30, "attr": {"hp": 300, "magic": 300}, "currency": [{"type": 1, "value": 100}, {"type": 2, "value": 200}] },
		]

	'''	
	xml_l = [
				{"id": 1, "lv": 10},
				{"id": 2, "lv": 20},
				{"id": 3, "lv": 30},
			]
	'''
	print to_xml('test', xml_l)
	

if __name__ == '__main__':
	test_to_xml()
