@ECHO off


del *.class
del network\*.class
del protocol\*.class


xcopy %CD%\..\..\..\data\data.code.java.client\* protocol\ /y


javac Client.java

java Client


PAUSE
