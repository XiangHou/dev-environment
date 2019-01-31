# MariaDB 10.4.1
# Reference of docker image: https://mariadb.com/kb/en/library/installing-and-using-mariadb-via-docker/
# Version: 0.1.0

FROM mariadb:10.4.1

MAINTAINER Core <hfreedomx@gmail.com>

WORKDIR /datas

VOLUME ["/applications/datas"]

# Publish the port 3306 to suport the connection from outside of container
EXPOSE 3306

# Refers to https://hub.docker.com/_/mariadb
# The parameters to setting the account of MySQL
ENV MYSQL_ROOT_PASSWORD "111111"
ENV MYSQL_USER "tester"
ENV MYSQL_PASSWORD "111111"
ENV MYSQL_DATADIR "/applications/datas"

# When a container is started for the first time, a new database with the specified name will be created and initialized with the provided configuration variables.
# Furthermore, it will execute files with extensions .sh, .sql and .sql.gz that are found in /docker-entrypoint-initdb.d.
# Files will be executed in alphabetical order.
# You can easily #populate your mariadb services by mounting a SQL dump into that directory and provide custom images with contributed data.
# SQL files will be imported by default to the database specified by the MYSQL_DATABASE variable.
COPY ./docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/

# CMD ["/opt/bin/start.sh"]
