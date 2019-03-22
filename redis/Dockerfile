# Redis 5.0.3
# Reference of docker image: https://hub.docker.com/_/redis
# Version: 0.1.0

FROM redis:5.0.3

MAINTAINER Core <hfreedomx@gmail.com>

WORKDIR /applications

COPY master-slave/ ./
COPY cluster/ ./

RUN chmod +x /applications/create-cluster.sh

RUN mkdir -p /applications/logs
RUN mkdir -p /usr/local/var/log/redis
RUN touch /usr/local/var/log/redis/6379.log
RUN touch /usr/local/var/log/redis/6380.log
RUN chmod 777 /usr/local/var/log/redis/6379.log
RUN chmod 777 /usr/local/var/log/redis/6380.log

VOLUME ["/datas"]

# Publish the port 6379 to suport the connection from outside of container to master
# Publish the port 6380 to suport the connection from outside of container to slave
# Publish the port 16379 and 16380 to suport the connection of Cluster
EXPOSE 6379 6380 16379 16380

# Uses -e ROLE=? to transfer the parameter
# master = master node / slave = slave node
ENV ROLE ""
ENV CONFIG_NAME ""
ENV START_PARAM ""
# refer: https://docs.docker.com/engine/reference/builder/#cmd
CMD redis-server ${START_PARAM} /applications/${CONFIG_NAME}
