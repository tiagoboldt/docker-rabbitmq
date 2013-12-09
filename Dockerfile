FROM ubuntu:latest

ADD install/bin/install-rabbitmq /usr/bin/install-rabbitmq
RUN /usr/bin/install-rabbitmq

# Install start scripts and hosts file
ADD install/bin/pipework /usr/bin/
ADD install/bin/start-rabbitmq /usr/bin/
ADD install/bin/run-command /usr/bin/

# For RabbitMQ
EXPOSE 5672

# For RabbitMQ Admin
# EXPOSE 15672
