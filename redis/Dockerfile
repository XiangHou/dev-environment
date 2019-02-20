# Redis 5.0.3
# Reference of docker image: https://hub.docker.com/_/redis
# Version: 0.1.0

FROM redis:5.0.3

MAINTAINER Core <hfreedomx@gmail.com>

WORKDIR /applications

COPY master-slave/ ./

RUN mkdir -p /applications/logs


VOLUME ["/datas"]

# Publish the port 6379 to suport the connection from outside of container to master
# Publish the port 6380 to suport the connection from outside of container to slave
EXPOSE 6379 6380

# Uses -e ROLE=? to transfer the parameter
# master = master node / slave = slave node
ENV ROLE ""

# refer: https://docs.docker.com/engine/reference/builder/#cmd
CMD redis-server /applications/${ROLE}.redis.conf
