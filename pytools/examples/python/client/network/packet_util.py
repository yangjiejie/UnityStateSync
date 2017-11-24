#!/usr/bin/env python
# coding:utf-8

import struct


def read_u16(buff):
	val, = struct.unpack('>H', buff)
	return val
