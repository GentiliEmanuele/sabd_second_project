#!/bin/bash
set -e

echo "[INFO] applying delay 50ms±5ms (normal distribution)"
tc qdisc add dev eth0 root netem delay 50ms 5ms distribution normal
exec /docker-entrypoint.sh "$@"