@ECHO off


xcopy %CD%\..\..\..\data\data.code.php.server\* protocol /y

echo start composer dump-autoload

start composer dump-autoload


PAUSE
