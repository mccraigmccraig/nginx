#!/bin/dash

test -z "${PROXY_IP_ADDRESS}" && export PROXY_IP_ADDRESS=`ip route show 0.0.0.0/0 | awk '{print $3}'`

>&2 echo PORT: ${PORT}
>&2 echo PROXY_PORT: ${PROXY_PORT}
>&2 echo PROXY_IP_ADDRESS: ${PROXY_IP_ADDRESS}
ifconfig 1>&2
netstat -nr 1>&2
