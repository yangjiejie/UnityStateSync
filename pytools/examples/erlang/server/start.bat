@ECHO off


xcopy %CD%\..\..\..\data\data.code.erlang.common.server\const.pb.hrl include /y
xcopy %CD%\..\..\..\data\data.code.erlang.common.server\record.pb.hrl include /y

xcopy %CD%\..\..\..\data\data.code.erlang.server\pb.erl src /y


erl -noshell -s make all -s init stop


erl -pa ebin +P 1024000 -smp enable -s server


PAUSE
