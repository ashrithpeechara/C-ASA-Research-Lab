#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Experiment Preparation
#############################################

ROUTERS=("router1" "router2" "router3")

echo "==============================================="
echo " Preparing Experiment Environment"
echo "==============================================="

echo

#####################################################
# Docker
#####################################################

if ! docker info >/dev/null 2>&1
then
    echo "❌ Docker is NOT running."
    exit 1
fi

echo "✅ Docker Engine"

#####################################################
# Docker Compose
#####################################################

if ! docker compose version >/dev/null 2>&1
then
    echo "❌ Docker Compose Missing"
    exit 1
fi

echo "✅ Docker Compose"

#####################################################
# Containers
#####################################################

for R in "${ROUTERS[@]}"
do

STATUS=$(docker inspect -f '{{.State.Status}}' $R 2>/dev/null)

if [ "$STATUS" != "running" ]
then

echo "❌ $R not running."

echo "Starting..."

docker start $R >/dev/null

sleep 3

else

echo "✅ $R"

fi

done

#####################################################
# Network
#####################################################

echo
echo "Checking Docker Networks..."

docker network ls

#####################################################
# Verification
#####################################################

echo
echo "Running Lab Verification..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"$SCRIPT_DIR/verify_lab.sh"

echo

echo "==============================================="
echo " Experiment Environment Ready"
echo "==============================================="