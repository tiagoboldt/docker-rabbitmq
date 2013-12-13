FROM ubuntu:latest

ADD install/bin/install-rabbitmq /usr/bin/install-rabbitmq

# Install start scripts and hosts file
ADD install/bin/start-rabbitmq /usr/bin/

RUN /usr/bin/install-rabbitmq

# For RabbitMQ
EXPOSE 5672

# For erlang
EXPOSE 4369
#EXPOSE 35197
#EXPOSE 35198

# For RabbitMQ Admin
EXPOSE 15672
