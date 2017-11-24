#!/usr/bin/python
# coding:utf-8
from sys import path
path.append(r'../')

import conf

from utils import tool


def parse(val):
	key			= val['key']
	file_xml	= val['file_xml']
	value_xml	= val['value_xml']
		
	if file_xml:
		file_name	= conf.data_xml + file_xml
		xml_str		= tool.to_xml(key, value_xml)
		fd			= open(file_name, 'w+')
		fd.write(xml_str.encode('utf-8'))
		fd.close()
