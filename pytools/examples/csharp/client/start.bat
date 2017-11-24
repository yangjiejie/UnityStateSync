@ECHO off


del Client.exe

xcopy %CD%\..\..\..\data\data.code.csharp.client\* Protocol /y

csc Client.cs Network\*.cs Protocol\*.cs

Client.exe


PAUSE
