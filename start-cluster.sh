#!/bin/bash

source install/common.sh

check_usage $# 1 "Usage: $0 <NUMBER OF NODES>"

IMAGE=rabbitmq:cluster_test
NODES=$1
BRIDGE=br1

test_image $IMAGE

for id in $(seq 1 $NODES); do

	echo "Starting node $id"
	hostname="rabbit$id"
	ip=192.168.100.$id

	# start container
	if [[ $id == 1 ]]; then
		ports="-p 127.0.0.1:15672:15672 -p 127.0.0.1:5672:5672 -p 127.0.0.1:1234:22"
	else
		ports=""
	fi
	cid=$(sudo docker run -d -dns 127.0.0.1 -h $hostname $ports -t $IMAGE /usr/bin/start-rabbitmq)

	# Add network interface
	# sleep 1
	# sudo pipework $BRIDGE $cid $ip/24

done
