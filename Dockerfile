FROM ubuntu:latest

# Install start scripts and hosts file
ADD install/bin/install-rabbitmq /usr/bin/
ADD install/bin/start-rabbitmq /usr/bin/
RUN /usr/bin/install-rabbitmq

# For RabbitMQ
EXPOSE 5672

# For erlang
EXPOSE 4369

# For RabbitMQ Admin
EXPOSE 15672
