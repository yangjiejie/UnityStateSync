#!/usr/bin/env python
# coding:utf-8
import conf
import os
import copy

from excel import excel, excel_xml


for dirpath, dirnames, filenames in os.walk(conf.data_exl):
	for filetmp in filenames:
		filename = dirpath + filetmp
		if os.path.isfile(filename):
			if os.path.splitext(filename)[1] == '.xlsx':
				rows = excel.read(filename)
				val = excel.parse(rows)

				_tmp_val	= copy.deepcopy(val)
				excel_xml.parse(_tmp_val)

				for lang in conf.langs_xml:
					_tmp_val	= copy.deepcopy(val)
					_lang		= lang['lang']
					_data_path	= conf.data_dir + lang['data'] + '/'
					_common_path= conf.data_dir + lang['common'] + '/'

					lang_module	= 'excel_' + _lang
					exec('from excel import %s' % lang_module)
					exec(lang_module + '.parse(_data_path, _common_path, _tmp_val)')
