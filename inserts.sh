#!/bin/bash
docker run --net=aero_asnet -i aerospike/aerospike-tools aql -h 172.18.0.2 <<EOF
insert into test.foo (PK, foo) values ('123','my string')
EOF
