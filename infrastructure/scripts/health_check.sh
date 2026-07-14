#!/bin/bash

ROUTERS=("router1" "router2" "router3")

echo "========================================"
echo " Cognitive ASA Lab Health Dashboard"
echo "========================================"

echo

docker ps --format "table {{.Names}}\t{{.Status}}"

echo

for R in "${ROUTERS[@]}"
do

echo "========================================"
echo "$R"
echo "========================================"

STATUS=$(docker inspect -f '{{.State.Status}}' $R)

echo "Status : $STATUS"

if [ "$STATUS" != "running" ]; then
    echo "Skipping..."
    echo
    continue
fi

echo
echo "IP Addresses"
docker exec $R ip addr | grep inet

echo
echo "FRR Processes"
docker exec $R ps | grep -E "zebra|ospfd|watchfrr"

echo
echo "OSPF Neighbors"
docker exec $R vtysh -c "show ip ospf neighbor"

echo
echo "Routes"
docker exec $R vtysh -c "show ip route"

echo
echo "Interface Statistics"
docker exec $R ip -s link

echo

done

echo "========================================"
echo "Health Check Completed"
echo "========================================"