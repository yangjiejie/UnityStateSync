@ECHO off


SET GOPATH=%CD%


del bin\server.exe
del bin\client.exe


xcopy %CD%\..\..\data\data.code.golang.server\* src\server\proto /y
xcopy %CD%\..\..\data\data.code.golang.client\* src\client\proto /y

go install server
go install client


PAUSE
