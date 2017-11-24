@ECHO off


del Server.exe

xcopy %CD%\..\..\..\data\data.code.csharp.server\* Protocol /y

csc Server.cs Network\*.cs Protocol\*.cs

Server.exe


PAUSE
