#!/usr/bin/env python
# coding:utf-8
from sys import path
path.append(r'../')

from utils import tool

import os
import string
import xlrd


#a	= 'sys'
#sys= __import__(a)

#exec('import %s' % a)


'''
读取excel文件返回数据列表
'''
def read(filename):
	print 'filename:', filename

	if not os.path.isfile(filename):
		raise StandardError('File %s Not Found!' % filename)
		
	rows = list()
	
	work_book = xlrd.open_workbook(filename)
	for sheet in work_book.sheets():
		nrows   = sheet.nrows
		for row_index in range(0, nrows):
			rows.append(sheet.row_values(row_index))

	return rows


def parse(rows):
	rem         = list()
	name        = dict()
	key			= ''
	
	keys_erl 	= list()
	keys_xml 	= list()
	
	file_erl    = ''
	file_xml    = ''
	
	value      = list()
	value_erl  = list()
	value_xml  = list()
	
	
	fields     = dict()
	erl        = dict()
	xml		   = dict()


	for rs in rows:
		row_head 	= tool.intotrim(rs[0])
		row_second	= tool.intotrim(rs[1])
		if row_head == 'REM':
			rem.append(row_second)
		elif row_head == 'KEY':
			key         = row_second
		elif row_head == 'FILE_ERL':
			file_erl    = row_second
		elif row_head == 'FILE_XML':
			file_xml    = row_second
		elif row_head == 'FIELDS':
			for k in range(1, len(rs)):
				v = string.strip(rs[k])
				if v:
					fields[k]   = v.lower()
		elif row_head == 'ERL':
			for k in range(1, len(rs)):
				v = string.strip(rs[k])
				if fields[k]:
					erl[ fields[k] ]  = v
					if v == 'key':
						keys_erl.append(fields[k])
		elif row_head == 'XML':
			for k in range(1, len(rs)):
				v = string.strip(rs[k])
				if fields[k]:
					xml[ fields[k] ]  = v
					if v == 'key':
						keys_xml.append(fields[k])
		elif row_head == 'NAME':
			for k in range(1, len(rs)):
				v = tool.intotrim(rs[k])
				if fields[k]:
					name[ fields[k] ]  = v
		elif row_head == 'VALUE':
			_vs     = dict()
			_vs_erl = dict()
			_vs_xml = dict()
			for k in range(1, len(rs)):
				if fields[k]:
					v = tool.intotrim(rs[k])
					field   = fields[k]
					if field.find('.') > 0:
						# 暂时只考虑二级字典
						field1      = field.split('.', 2)
						if not _vs.get(field1[0]):
							_vs[ field1[0] ] = dict()
						_vs[ field1[0] ][ field1[1] ]    = v
						if erl[ fields[k] ] == 'key' or erl[ fields[k] ] == 'yes':
							if not _vs_erl.get(field1[0]):
								_vs_erl[ field1[0] ] = dict()
							_vs_erl[ field1[0] ][ field1[1] ]    = v
						if xml[ fields[k] ] == 'key' or xml[ fields[k] ] == 'yes':
							if not _vs_xml.get(field1[0]):
								_vs_xml[ field1[0] ] = dict()
							_vs_xml[ field1[0] ][ field1[1] ]    = v
					else:
						_vs[ field ]  = v
						if erl[ fields[k] ] == 'key' or erl[ fields[k] ] == 'yes':
							_vs_erl[ field ]  = v
						if xml[ fields[k] ] == 'key' or xml[ fields[k] ] == 'yes':
							_vs_xml[ field ]  = v

			value.append(_vs)
			value_erl.append(_vs_erl)
			value_xml.append(_vs_xml)
		else:
			pass
			
	if len(keys_erl) == 0:
		keys_erl.append('id')
		
	return {
			'rem':      	rem,
			'name':     	name,
			'key':			key,
			
            'keys_erl':		keys_erl,
            'keys_xml':		keys_xml,

            'file_erl': 	file_erl,
			'file_xml': 	file_xml,

            'value':   		value,
            'value_erl':	value_erl,
			'value_xml':	value_xml,
           }


if __name__ == '__main__':
	p_filename  = '../data/data.exl/pay.xlsx'
	rows      	= read(p_filename)
	results     = parse(rows)
	print(results)
