#!/usr/bin/env python
# coding:utf-8
import conf
import os
import copy


from proto import proto


protos_all = []
for dirpath, dirnames, filenames in os.walk(conf.data_proto):
    for filetmp in filenames:
        filename = dirpath + filetmp
        if os.path.isfile(filename):
            if os.path.splitext(filename)[1] == '.proto':
                protos = proto.parse(filename)
                protos_all.extend(protos)

for lang in conf.langs_proto:
    _tmp_protos_all = copy.deepcopy(protos_all)
    _lang           = lang['lang']
    _code_path      = conf.data_dir + lang['code'] + '/'
    _common_path    = ''
    if 'common' in lang:
        _common_path= conf.data_dir + lang['common'] + '/'

    lang_module     = 'proto_' + _lang
    exec('from proto import %s' % lang_module)
    exec(lang_module + '.parse(_code_path, _common_path, _tmp_protos_all)')
