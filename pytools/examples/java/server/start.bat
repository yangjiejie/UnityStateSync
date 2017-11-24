@ECHO off


del *.class
del network\*.class
del protocol\*.class


xcopy %CD%\..\..\..\data\data.code.java.server\* protocol\ /y


javac Server.java

java Server


PAUSE
