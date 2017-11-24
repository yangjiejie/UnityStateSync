#!/bin/bash


rm -f *.class
rm -f network/*.class
rm -f protocol/*.class


\cp ../../../data/data.code.java.client/* protocol/


javac Client.java

java Client
