#!/bin/bash


rm -f ./server

cp -f ../../../data/data.code.cpp.server/* protocol/


g++ server.cpp network/Packet.cpp -o server -Icommon -Inetwork -Iprotocol -Isocket


./server
