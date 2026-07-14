#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Collect Logs
#############################################

set -e

ROUTERS=("router1" "router2" "router3")

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_DIR="$SCRIPT_DIR/logs/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$LOG_DIR"

echo "=========================================="
echo " Collecting Lab Logs"
echo "=========================================="
echo

for R in "${ROUTERS[@]}"
do

echo "Collecting logs from $R..."

mkdir -p "$LOG_DIR/$R"

docker logs "$R" > "$LOG_DIR/$R/docker.log" 2>&1

docker exec "$R" ip addr > "$LOG_DIR/$R/ip_addr.txt"

docker exec "$R" ip route > "$LOG_DIR/$R/routes.txt"

docker exec "$R" ip -s link > "$LOG_DIR/$R/interface_stats.txt"

docker exec "$R" vtysh -c "show ip route" \
> "$LOG_DIR/$R/frr_routes.txt" 2>/dev/null || true

docker exec "$R" vtysh -c "show ip ospf neighbor" \
> "$LOG_DIR/$R/ospf_neighbors.txt" 2>/dev/null || true

docker exec "$R" ps > "$LOG_DIR/$R/processes.txt"

echo "Done."

echo

done

docker ps -a > "$LOG_DIR/docker_ps.txt"

docker network ls > "$LOG_DIR/docker_networks.txt"

docker images > "$LOG_DIR/docker_images.txt"

echo "=========================================="
echo " Logs saved in:"
echo "$LOG_DIR"
echo "=========================================="