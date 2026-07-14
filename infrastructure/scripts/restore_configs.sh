#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Restore Router Configurations
#############################################

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_ROOT="$SCRIPT_DIR/backup"

echo "=========================================="
echo " Restore Router Configurations"
echo "=========================================="
echo

if [ ! -d "$BACKUP_ROOT" ]; then
    echo "No backup directory found."
    exit 1
fi

LATEST_BACKUP=$(ls -td "$BACKUP_ROOT"/* | head -1)

echo "Latest Backup:"
echo "$LATEST_BACKUP"
echo

read -p "Restore latest backup? (y/n): " CONFIRM

if [[ "$CONFIRM" != "y" ]]; then
    echo "Cancelled."
    exit
fi

ROUTERS=("router1" "router2" "router3")

for R in "${ROUTERS[@]}"
do

echo
echo "Restoring $R..."

if [ -d "$LATEST_BACKUP/$R/frr" ]; then

docker cp "$LATEST_BACKUP/$R/frr/." "$R:/etc/frr"

echo "Configuration restored."

else

echo "No configuration found."

fi

done

echo
echo "Restarting Lab..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"$SCRIPT_DIR/restart_lab.sh"

echo
echo "Restore Completed Successfully."