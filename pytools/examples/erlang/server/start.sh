#!/bin/bash


\cp ../../../data/data.code.erlang.common.server/const.pb.hrl include/
\cp ../../../data/data.code.erlang.common.server/record.pb.hrl include/

\cp ../../../data/data.code.erlang.server/pb.erl src/mod_pb


erl -noshell -s make all -s init stop


erl -pa ebin +P 1024000 -smp enable -s server
