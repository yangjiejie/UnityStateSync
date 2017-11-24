@ECHO off


xcopy %CD%\..\..\..\data\data.code.lua53.server\* protocols /y


lua main.lua


PAUSE
