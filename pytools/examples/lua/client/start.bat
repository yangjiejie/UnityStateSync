@ECHO off


xcopy %CD%\..\..\..\data\data.code.lua.client\* protocols /y


lua main.lua


PAUSE
