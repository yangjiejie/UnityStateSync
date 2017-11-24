@ECHO off


xcopy %CD%\..\..\..\data\data.code.python.server\* protocol\ /y


python main.py


PAUSE
