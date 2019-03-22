# !/bin/bash
CMD="${1}"

/usr/local/bin/redis-server /applications/slave.redis.cluster.conf

echo yes | ${CMD}
