@ECHO off


xcopy %CD%\..\..\..\data\data.code.php.client\* protocol /y

echo start composer dump-autoload

start composer dump-autoload


PAUSE
