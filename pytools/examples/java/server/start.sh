#!/bin/bash


rm -f *.class
rm -f network/*.class
rm -f protocol/*.class


\cp ../../../data/data.code.java.server/* protocol/


javac Server.java

java Server
