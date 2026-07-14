#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Live Resource Monitor
#############################################

ROUTERS=("router1" "router2" "router3")

while true
do
clear

echo "==============================================="
echo "      Cognitive ASA Live Monitor"
echo "==============================================="
echo

docker ps --format "table {{.Names}}\t{{.Status}}"

echo
echo "Docker Resource Usage"
echo "-----------------------------------------------"
docker stats --no-stream

echo

for R in "${ROUTERS[@]}"
do

STATUS=$(docker inspect -f '{{.State.Status}}' $R 2>/dev/null)

echo "==============================================="
echo "$R"
echo "==============================================="

if [ "$STATUS" != "running" ]
then
    echo "Container is NOT running."
    echo
    continue
fi

echo
echo "IP Address"
docker exec $R ip addr | grep inet

echo
echo "Interface Statistics"
docker exec $R ip -s link

echo
echo "Routing Table Summary"
docker exec $R ip route

echo

done

echo
echo "Refreshing in 5 seconds..."
sleep 5

done