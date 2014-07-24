#!/bin/bash

source install/common.sh

check_usage $# 0 "Usage: $0"

IMAGE=rabbitmq:cluster_test

test_image $IMAGE

if docker ps -a | grep $IMAGE >/dev/null; then
	cids=$(docker ps -a | grep $IMAGE | awk '{ print $1 }')
	echo $cids | xargs echo "Killing and removing containers"
	docker kill $cids > /dev/null
	docker rm $cids   > /dev/null
fi
