@ECHO off


xcopy %CD%\..\..\..\data\data.code.lua53.client\* protocols /y


lua main.lua


PAUSE
