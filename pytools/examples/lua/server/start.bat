@ECHO off


xcopy %CD%\..\..\..\data\data.code.lua.server\* protocols /y


lua main.lua


PAUSE
