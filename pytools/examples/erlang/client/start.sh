#!/bin/bash


\cp ../../../data/data.code.erlang.common.client/const.pb.hrl include/
\cp ../../../data/data.code.erlang.common.client/record.pb.hrl include/

\cp ../../../data/data.code.erlang.client/pb.erl src/mod_pb


erl -noshell -s make all -s init stop


erl -pa ebin +P 1024000 -smp enable -s client
