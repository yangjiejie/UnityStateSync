@ECHO off


xcopy %CD%\..\..\..\data\data.code.erlang.common.client\const.pb.hrl include /y
xcopy %CD%\..\..\..\data\data.code.erlang.common.client\record.pb.hrl include /y

xcopy %CD%\..\..\..\data\data.code.erlang.client\pb.erl src /y


erl -noshell -s make all -s init stop


erl -pa ebin +P 1024000 -smp enable -s client


PAUSE
