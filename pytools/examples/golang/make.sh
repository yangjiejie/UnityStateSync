#!/bin/bash

export GOPATH=$(dirname $(readlink -f ${0}))


\cp ${GOPATH}/../../data/data.code.golang.server/* ./src/server/proto
\cp ${GOPATH}/../../data/data.code.golang.client/* ./src/client/proto


go install server
go install client
