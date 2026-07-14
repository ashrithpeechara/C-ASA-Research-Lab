#!/bin/bash

echo "========================================"
echo " Restarting Cognitive ASA Lab"
echo "========================================"

cd ..

docker compose down

echo
echo "Waiting..."
sleep 5

docker compose up -d

echo
echo "Waiting for routers..."
sleep 8

docker ps --format "table {{.Names}}\t{{.Status}}"

echo
echo "Restart Complete."