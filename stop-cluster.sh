#!/bin/bash

source install/common.sh

check_usage $# 0 "Usage: $0"

IMAGE=rabbitmq:cluster_test

test_image $IMAGE

if sudo docker ps | grep $IMAGE >/dev/null; then
	cids=$(sudo docker ps | grep $IMAGE | awk '{ print $1 }')
	echo $cids | xargs echo "Killing and removing containers"
	sudo docker kill $cids > /dev/null
	sudo docker rm $cids   > /dev/null
fi
