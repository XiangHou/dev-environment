# The environment of PHP + Mysql

## Description

## Reference
  - [Replication of Redis](https://redis.io/topics/replication)
  - [Redis Sentinel with Docker Compose](https://blog.alexseifert.com/2016/11/14/using-redis-sentinel-with-docker-compose/)

## Middleware
  - Redis
    - Version: 5.0.3

## Preparation
  - Docker networking mode
    - network name: redis-cluster-dev
    - command:
      - Adding network: `docker network create redis-cluster-dev`
      - list out all networks: `docker network ls`

## Recommend
  - Image name:
    - Redis: redis-docker-dev


## Command
  - Build the image from Dockerfile
    - `docker build -t {image name} .`
  - Check the configuration of Redis server
    - master: `docker run -e ROLE="master" -v {the data folder on local}:/datas -p 6379:6379 -it {redis image name}`
    - slave: `docker run -e ROLE="slave" -v {the data folder on local}:/datas -p 6380:6380 -it {redis image name}`
  - Start a instance of Redis server
    - master: `docker run -e ROLE="master" -v {the data folder on local}:/datas -p 6379:6379 -d {redis image name}`
    - slave: `docker run -e ROLE="slave" -v {the data folder on local}:/datas -p 6380:6380 -d {redis image name}`
  - Login into Redis server
    - command: `docker exec -it {container id}  /bin/bash`

## How to start an instance of Redis server.
  - command: `redis-server {path of redis.conf}`

## How to connect to Redis server.
  - redis-cli Client:
    - command: `redis-cli -h {host} -p {port} -a {password}`
  - redis-cli Client(Enable Cluster Mode):
    - command: `redis-cli -c -h {host} -p {port} -a {password}`

## Information
  - Replication
    ```
    # Replication
    role:master
    connected_slaves:2
    slave0:ip=172.19.0.4,port=6380,state=online,offset=546,lag=1
    slave1:ip=172.19.0.3,port=6380,state=online,offset=546,lag=1
    master_replid:a5c7158b9b090514e5d3d9241283f33ed62bc49e
    master_replid2:0000000000000000000000000000000000000000
    master_repl_offset:546
    second_repl_offset:-1
    repl_backlog_active:1
    repl_backlog_size:1048576
    repl_backlog_first_byte_offset:1
    repl_backlog_histlen:546
    ```
  - Log of replication
    ```
    master_1   | 1:M 25 Feb 2019 07:11:39.101 * 1 changes in 900 seconds. Saving...
    master_1   | 1:M 25 Feb 2019 07:11:39.102 * Background saving started by pid 19
    slave_1_1  | 1:S 25 Feb 2019 07:11:39.101 * 1 changes in 900 seconds. Saving...
    slave_1_1  | 1:S 25 Feb 2019 07:11:39.102 * Background saving started by pid 16
    slave_2_1  | 1:S 25 Feb 2019 07:11:39.103 * 1 changes in 900 seconds. Saving...
    slave_2_1  | 1:S 25 Feb 2019 07:11:39.105 * Background saving started by pid 16
    slave_1_1  | 16:C 25 Feb 2019 07:11:39.108 * DB saved on disk
    slave_1_1  | 16:C 25 Feb 2019 07:11:39.111 * RDB: 0 MB of memory used by copy-on-write
    slave_2_1  | 16:C 25 Feb 2019 07:11:39.111 * DB saved on disk
    slave_2_1  | 16:C 25 Feb 2019 07:11:39.111 * RDB: 0 MB of memory used by copy-on-write
    master_1   | 19:C 25 Feb 2019 07:11:39.112 * DB saved on disk
    master_1   | 19:C 25 Feb 2019 07:11:39.113 * RDB: 0 MB of memory used by copy-on-write
    master_1   | 1:M 25 Feb 2019 07:11:39.204 * Background saving terminated with success
    slave_1_1  | 1:S 25 Feb 2019 07:11:39.205 * Background saving terminated with success
    slave_2_1  | 1:S 25 Feb 2019 07:11:39.206 * Background saving terminated with success
    master_1   | 1:M 25 Feb 2019 07:11:39.101 * 1 changes in 900 seconds. Saving...
    master_1   | 1:M 25 Feb 2019 07:11:39.102 * Background saving started by pid 19
    slave_1_1  | 1:S 25 Feb 2019 07:11:39.101 * 1 changes in 900 seconds. Saving...
    slave_1_1  | 1:S 25 Feb 2019 07:11:39.102 * Background saving started by pid 16
    slave_2_1  | 1:S 25 Feb 2019 07:11:39.103 * 1 changes in 900 seconds. Saving...
    slave_2_1  | 1:S 25 Feb 2019 07:11:39.105 * Background saving started by pid 16
    slave_1_1  | 16:C 25 Feb 2019 07:11:39.108 * DB saved on disk
    slave_1_1  | 16:C 25 Feb 2019 07:11:39.111 * RDB: 0 MB of memory used by copy-on-write
    slave_2_1  | 16:C 25 Feb 2019 07:11:39.111 * DB saved on disk
    slave_2_1  | 16:C 25 Feb 2019 07:11:39.111 * RDB: 0 MB of memory used by copy-on-write
    ```
## Command of UnitTest

## Need to pay attention of redis.conf
  - Common
    - bind
    - protected-mode
    - port
    - tcp-backlog
    - timeout
    - tcp-keepalive
    - daemonize
    - supervised
    - loglevel
    - logfile
    - syslog-enable
    - syslog-ident
    - databases
    - always-show-logo
    - stop-writes-on-bgsave-error
    - rdbcompression
    - dbfilename
    - dir
  - REPLICATION
    - masterauth
    - replica-serve-stale-data
    - replica-read-only
    - repl-diskless-sync
    - repl-diskless-sync-delay
    - repl-ping-replica-period
    - repl-timeout
    - repl-disable-tcp-nodelay
    - repl-backlog-size
    - repl-backlog-ttl
    - replica-priority
    - min-replicas-to-write
    - min-replicas-max-lag
    - replica-announce-ip
    - replica-announce-port
  - CLUSTER
    - requirepass
    - maxclients
    - maxmemory
    - maxmemory-policy
    - maxmemory-samples
    - replica-ignore-maxmemory(New for Redis V5)
  - LAZY FREEING
    - lazyfree-lazy-eviction
    - lazyfree-lazy-expire
    - lazyfree-lazy-server-del
    - replica-lazy-flush
  - APPEND ONKY MODE
    - appendonly
    - appendfilename
    - appendfsync
    - no-appendfsync-on-rewrite
    - auto-aof-rewrite-percentage
    - auto-aof-rewrite-min-size
    - aof-load-truncated
    - aof-use-rdb-preamble
  - LUA SCRIPTING
    - lua-time-limit
  - REDIS CLUSTER
    - cluster-enabled
    - cluster-config-file
    - cluster-node-timeout
    - cluster-replica-validity-factor
    - cluster-migration-barrier
    - cluster-require-full-coverage
    - cluster-replica-no-failover
  - CLUSTER DOCKER/NAT support
    - cluster-announce-ip
    - cluster-announce-port
    - cluster-announce-bus-port
  - SLOW LOG
    - slowlog-max-len
  - LATENCY MONITOR
    - latency-monitor-threshold
  - EVENT NOTIFICATION
    - notify-keyspace-events
  - ADVANCED CONFIG
    - hash-max-ziplist-entries
    - hash-max-ziplist-value
    - list-max-ziplist-size
    - list-compress-depth
    - set-max-intset-entries
    - zset-max-ziplist-entries
    - zset-max-ziplist-value
    - hll-sparse-max-bytes
    - stream-node-max-bytes
    - stream-node-max-entries
    - activerehashing
    - client-output-buffer-limit
    - client-query-buffer-limit
    - proto-max-bulk-len
    - hz
    - dynamic-hz
    - aof-rewrite-incremental-fsync
    - rdb-save-incremental-fsync
    - lfu-log-factor
    - lfu-decay-time
  - ACTIVE DEFRAGMENTATION
    - activedefrag
    - active-defrag-ignore-bytes
    - active-defrag-threshold-upper
    - active-defrag-cycle-min
    - active-defrag-cycle-max
    - active-defrag-max-scan-fields

  - CLUSER SERVER
    - REPLICATION
      - Master node
        - save
          ```
          save 900 1
          save 300 10
          save 60 10000
          ```
        - loglevel debug
        - repl-disable-tcp-nodelay yes
        - maxclients 50000 or 0
        - maxmemory 2GB
        - maxmemory-policy noeviction
        - ADVANCED CONFIG
          - client-output-buffer-limit
            ```
            client-output-buffer-limit normal 0 0 0
            client-output-buffer-limit replica 256mb 64mb 60
            client-output-buffer-limit pubsub 32mb 8mb 60
            ```
      - Slave node
