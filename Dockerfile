FROM ubuntu:latest

ADD install/bin/install-rabbitmq /usr/bin/install-rabbitmq
RUN /usr/bin/install-rabbitmq

# Install start scripts and hosts file
ADD install/bin/pipework /usr/bin/
ADD install/bin/start-rabbitmq /usr/bin/
ADD install/bin/run-command /usr/bin/

# Configure Host Names
ADD install/etc/rabbit.hosts /etc/dnsmasq.d/0hosts
ADD install/etc/dnsmasq.conf /etc/dnsmasq.conf
ADD install/etc/resolv.conf /etc/resolv.dnsmasq.conf

# For RabbitMQ
EXPOSE 5672

# For RabbitMQ Admin
EXPOSE 15672
