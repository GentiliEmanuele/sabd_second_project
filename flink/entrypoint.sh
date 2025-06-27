#!/bin/bash
set -e

if [ "${USE_NETEM:-}" = "true" ]; then
    echo "[INFO] applying delay 50ms±5ms (normal distribution)"
    tc qdisc add dev eth0 root netem delay 10ms 2ms distribution normal
else
    echo "[INFO] netem is disabled"
fi

exec /docker-entrypoint.sh "$@"