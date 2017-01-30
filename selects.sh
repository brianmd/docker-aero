#!/bin/bash
docker run --net=aero_asnet -i aerospike/aerospike-tools aql -h 172.18.0.3 <<EOF
select * from test.foo
EOF
