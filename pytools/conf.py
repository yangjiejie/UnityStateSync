#!/usr/bin/env python
# coding:utf-8
import os


data_dir            = os.path.join(os.path.dirname(__file__), '../')

data_proto			= data_dir + 'Proto/'
data_exl			= data_dir + 'data.exl/'

data_xml			= data_dir + 'data.xml/'


'''
需要导出协议文件的语言选项
现支持:
    erlang_server
    erlang_client
    csharp_server
    csharp_client
    golang_server
    golang_client
    cpp_server
    cpp_client
    java_server
    java_client
    lua_server
    lua_client
    lua53_server
    lua53_client
    python_server
    python_client
    php_server
    php_client

配置格式:
    lang:       需要导出的语言
    code:       协议文件导出目录
    common:		常量和协议记录目录(erlang需要, 其它语言不用配置)
'''
langs_proto = [
    {
        'lang':     'erlang_server',
        'code':     'Server/src/',
        'common':   'Server/include/'
    },
    {
        'lang':     'csharp_client',
        'code':     'Assets/Scripts/Proto/'
    }
]

'''
需要导出excel文件的语言选项
现支持导出成xml数据
现支持语言数据:
    erlang
    csharp(常量跟错误常量)
'''
langs_xml = [
    {
        'lang':     'erlang',
        'data':     'data.erl',
        'common':   'data.code.erlang.common.server'
    },
    {
        'lang':     'csharp',
        'data':     '',
        'common':   'data.code.csharp.common'
    }
]
