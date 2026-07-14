#!/bin/bash

echo "========================================"
echo " Stopping Cognitive ASA Lab"
echo "========================================"

cd ..

docker compose down

echo
echo "All containers stopped."