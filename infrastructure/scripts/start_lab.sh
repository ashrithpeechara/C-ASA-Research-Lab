#!/bin/bash

echo "========================================"
echo " Starting Cognitive ASA Lab"
echo "========================================"

cd ..

docker compose up -d

echo
echo "Waiting for containers to initialize..."
sleep 8

echo
echo "Container Status"
docker ps --format "table {{.Names}}\t{{.Status}}"

echo
echo "Lab Started Successfully."