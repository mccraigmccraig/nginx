#!/bin/dash

export GATEWAY_IP_ADDRESS=`ip route show 0.0.0.0/0 | awk '{print $3}'`
