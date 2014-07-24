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
		ports="-p 15672:15672"
	else
		ports=$(docker ps | grep rabbit | awk '{print $NF}' | sed "s/.*\(rabbit[0-9]*\).*/--link \1:\1/" | tr "\\n" " ")
	fi
	echo $ports
	cid=$(docker run -d -h $hostname --dns 127.0.0.1 --name $hostname $ports -t $IMAGE  "/usr/bin/start-rabbitmq")

	# Add network interface
	sleep 5
	# sudo pipework $BRIDGE $cid $ip/24

done
