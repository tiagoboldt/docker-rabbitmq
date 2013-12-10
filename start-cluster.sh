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
		ports="-p 15672:15672 -p 5672:5672 -name rabbit1"
	else
		ports="-link rabbit1:master"
	fi
	cid=$(sudo docker run -d -h $hostname $ports -t $IMAGE  "/usr/bin/start-rabbitmq")

	# Add network interface
	#sleep 1
	#sudo pipework $BRIDGE $cid $ip/24

done
