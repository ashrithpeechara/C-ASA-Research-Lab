#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Complete Lab Reset Utility
#############################################

set -e

echo "=========================================="
echo "       Cognitive ASA Lab Reset"
echo "=========================================="
echo

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "[1/7] Moving to Docker directory..."
cd "$PROJECT_DIR"

echo
echo "[2/7] Stopping existing containers..."
docker compose down

echo
echo "[3/7] Removing orphan containers..."
docker compose down --remove-orphans

echo
echo "[4/7] Cleaning unused Docker resources..."
docker container prune -f
docker network prune -f

echo
echo "[5/7] Starting the lab..."
docker compose up -d

echo
echo "[6/7] Waiting for routers to initialize..."
sleep 10

echo
echo "[7/7] Container Status"
docker ps --format "table {{.Names}}\t{{.Status}}"

echo
echo "=========================================="
echo " Lab Reset Completed Successfully"
echo "=========================================="
echo

echo "Tip:"
echo "Run './verify_lab.sh' to verify the lab."