#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Docker Cleanup Utility
#############################################

set -e

echo "=========================================="
echo "    Cognitive ASA Lab Cleanup Utility"
echo "=========================================="
echo

echo "[1/6] Removing stopped containers..."
docker container prune -f

echo
echo "[2/6] Removing unused Docker networks..."
docker network prune -f

echo
echo "[3/6] Removing dangling Docker images..."
docker image prune -f

echo
echo "[4/6] Removing unused build cache..."
docker builder prune -f

echo
echo "[5/6] Removing unused Docker volumes..."
docker volume prune -f

echo
echo "[6/6] Displaying Docker disk usage..."
docker system df

echo
echo "=========================================="
echo " Cleanup Completed Successfully"
echo "=========================================="