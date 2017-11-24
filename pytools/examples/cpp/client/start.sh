#!/bin/bash


rm -f ./client

cp -f ../../../data/data.code.cpp.client/* protocol/


g++ client.cpp network/Packet.cpp -o client -Icommon -Inetwork -Iprotocol -Isocket


./client
