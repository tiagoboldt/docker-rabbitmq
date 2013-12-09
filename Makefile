all: 
	docker build -t rabbitmq:cluster_test .
clean:
	docker rmi rabbitmq:cluster_test
