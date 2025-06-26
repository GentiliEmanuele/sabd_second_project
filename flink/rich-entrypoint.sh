#!/bin/bash
set -e

IFACE="eth0"

# Resolve hostnames to IPs
SERVER_IP=$(getent hosts micro-challenger | awk '{ print $1 }')

# Apply delay if server IP is found
if [ -n "$SERVER_IP" ]; then
    echo "[INFO] micro-challenger resolved to $SERVER_IP"
    
    # Clean previous qdisc
    tc qdisc del dev "$IFACE" root 2>/dev/null || true

    # Add root qdisc
    tc qdisc add dev "$IFACE" root handle 1: htb default 30

    # Classes for different delays
    tc class add dev "$IFACE" parent 1: classid 1:10 htb rate 1000Mbps
    tc class add dev "$IFACE" parent 1: classid 1:20 htb rate 1000Mbps

    # Apply netem delays
    tc qdisc add dev "$IFACE" parent 1:10 handle 10: netem delay 100ms
    tc qdisc add dev "$IFACE" parent 1:20 handle 20: netem delay 20ms

    # Filters to direct traffic
    tc filter add dev "$IFACE" protocol ip parent 1:0 prio 1 u32 match ip dst "$SERVER_IP"/32 flowid 1:10

    # Resolve other taskmanagers dynamically (optional)
    for i in $(seq 1 8); do
        TM_HOSTNAME="taskmanager-$i"
        TM_IP=$(getent hosts $TM_HOSTNAME | awk '{ print $1 }')
        if [ -n "$TM_IP" ]; then
            echo "[INFO] $TM_HOSTNAME resolved to $TM_IP"
            tc filter add dev "$IFACE" protocol ip parent 1:0 prio 1 u32 match ip dst "$TM_IP"/32 flowid 1:20
        fi
    done
else
    echo "[ERROR] Could not resolve micro-challenger"
fi

exec "$@"
