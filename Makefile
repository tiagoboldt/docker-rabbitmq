all: 
	docker build -t rabbitmq:cluster_test .
clean:
	./stop-cluster.sh
	docker rmi rabbitmq:cluster_test
