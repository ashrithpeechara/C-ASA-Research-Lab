#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Automatic Diagnosis
#############################################

ROUTERS=("router1" "router2" "router3")

echo "=========================================="
echo " Cognitive ASA Automatic Diagnosis"
echo "=========================================="

echo

####################################
# Docker
####################################

if ! docker info >/dev/null 2>&1
then
    echo "❌ Docker is not running."
    exit
fi

echo "✅ Docker is running."
echo

####################################
# Containers
####################################

for R in "${ROUTERS[@]}"
do

STATUS=$(docker inspect -f '{{.State.Status}}' $R 2>/dev/null)

if [ "$STATUS" != "running" ]
then
    echo "❌ $R is NOT running."
    continue
fi

echo "✅ $R running."

####################################
# FRR
####################################

docker exec $R ps | grep zebra >/dev/null

if [ $? -eq 0 ]
then
    echo "   ✅ Zebra"
else
    echo "   ❌ Zebra NOT Running"
fi

docker exec $R ps | grep ospfd >/dev/null

if [ $? -eq 0 ]
then
    echo "   ✅ OSPF"
else
    echo "   ❌ OSPF NOT Running"
fi

####################################
# IP Forwarding
####################################

IPF=$(docker exec $R cat /proc/sys/net/ipv4/ip_forward)

if [ "$IPF" = "1" ]
then
    echo "   ✅ IP Forwarding"
else
    echo "   ❌ IP Forwarding Disabled"
fi

####################################
# Routes
####################################

ROUTES=$(docker exec $R ip route | wc -l)

echo "   Routes : $ROUTES"

####################################
# Interfaces
####################################

INT=$(docker exec $R ip link | grep state | wc -l)

echo "   Interfaces : $INT"

echo

done

echo "=========================================="
echo " Diagnosis Finished"
echo "=========================================="