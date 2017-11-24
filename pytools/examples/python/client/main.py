#!/usr/bin/env python
# coding:utf-8
from sys import path
path.append(r'../')

import socket

from network.TcpClient import TcpClient


host	= '127.0.0.1'
port	= 8888


client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((host, port))


tcpClient = TcpClient(client_socket)
tcpClient.run()
