#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Backup Router Configurations
#############################################

set -e

ROUTERS=("router1" "router2" "router3")

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR/backup/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR"

echo "=========================================="
echo "      Backing Up Router Configurations"
echo "=========================================="
echo

for R in "${ROUTERS[@]}"
do
    echo "Backing up $R..."

    mkdir -p "$BACKUP_DIR/$R"

    docker cp "$R:/etc/frr" "$BACKUP_DIR/$R/" 2>/dev/null || echo "FRR config not found."

    docker exec "$R" ip addr > "$BACKUP_DIR/$R/ip_addr.txt"

    docker exec "$R" ip route > "$BACKUP_DIR/$R/routes.txt"

    docker inspect "$R" > "$BACKUP_DIR/$R/docker_inspect.json"

    echo "Done."
    echo
done

echo "=========================================="
echo "Backup Completed"
echo "Saved At:"
echo "$BACKUP_DIR"
echo "=========================================="