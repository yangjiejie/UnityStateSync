#!/usr/bin/env python
# coding:utf-8
from sys import path
path.append(r'../')

import socket

from network.TcpClient import TcpClient


host	= '127.0.0.1'
port	= 8888


server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((host, port))
server_socket.listen(1024)


while True:
	client_socket, addr = server_socket.accept()

	tcpClient = TcpClient(client_socket)
	try:
		tcpClient.run()
	except Exception, e:
		print 'Exception e:', e
		continue
