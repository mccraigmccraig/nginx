#!/bin/dash

export GATEWAY_IP_ADDRESS=`ip route show 0.0.0.0/0 | awk '{print $3}'`

>&2 echo PORT: ${PORT}
>&2 echo PROXY_PORT: ${PROXY_PORT}
>&2 echo GATEWAY_IP_ADDRESS: ${GATEWAY_IP_ADDRESS}
