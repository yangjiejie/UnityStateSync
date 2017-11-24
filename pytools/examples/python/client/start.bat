@ECHO off


xcopy %CD%\..\..\..\data\data.code.python.client\* protocol\ /y


python main.py


PAUSE
