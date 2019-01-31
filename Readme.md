# The environment of PHP + Mysql

## Description

## Middleware
  - PHP
    - Version: 7.2.14
  - Mysql
    - Name: MariaDB
    - Version: 10.4.1


## Recommend
  - Image name:
    - PHP: php-docker-dev
    - MySQL: mysql-docker-dev

## Command
  - Build the image from Dockerfile
    - `docker build -t {image name} .`
  - Run the command of image on the current path in local
    - `docker run -v $PWD:/applications/entry -it {image name}`
  - (Unimplemented)Run php to process php script file on current path
    - `docker run -v $PWD:/applications/entry -it {image name} {*****.php}`
  - Open a container of php to run command for entf(option)
    `docker run -v $PWD:/applications/entry -it {php image name} /bin/bash`
  - Start the MySQL server
    `docker run -v {the data folder on local}:/applications/datas -p 3306:3306 -it {mysql image name}`

## How to debug the resource in CLI
  1. Prepare the debug setting on IDE(PHPStorm or VS Code).
  2. Move to the folder of the project.
  3. Run command `docker run -v $PWD:/applications/entry -it {php image name} /bin/bash`.
  4. Start the debug monitor on IDE.
  5. Run the php script in the bash of container(STEP 3).

## xDebug for VS Code
  - AS
    ```
    {
        "name": "Listen for XDebug",
        "type": "php",
        "request": "launch",
        "port": 9001,
        "stopOnEntry": true,
        "pathMappings": {
            "/applications/entry/": "${workspaceRoot}"
        }
    }
    ```
## Command of UnitTest
  - `php ./tests/vendor/bin/phpunit --bootstrap ./tests/bootstrap.php ./tests/batch/MqCsvPushTest.php`
