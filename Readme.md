# The environment of PHP + Mysql

## Description

## Middleware
  - PHP
    - Version: 7.2.14
  - Mysql
    - Name: MariaDB
    - Version: 10.3


## Recommend
  - Image name:
    - PHP: php-docker-dev
    - MySQL: mysql-docker-dev

## Command
  - Build the image from Dockerfile
    - `docker build -t {image name} .`
  - Run the command of image on the current path in local
    - `docker run -v $PWD:/applications/entry -it {image name}`
  - Run php to process php script file on current path
    - `docker run -v $PWD:/applications/entry -it {image name} {*****.php}`
  - Open a container of php to run command for entf(option)
    `docker run -v $PWD:/applications/entry -it {php image name} /bin/bash`
