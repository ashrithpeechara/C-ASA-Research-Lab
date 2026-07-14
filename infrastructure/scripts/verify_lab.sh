#!/bin/bash

ROUTERS=("router1" "router2" "router3")

echo "========================================"
echo " Verifying Cognitive ASA Lab"
echo "========================================"

echo

PASS=1

for R in "${ROUTERS[@]}"
do

STATUS=$(docker inspect -f '{{.State.Status}}' $R 2>/dev/null)

if [ "$STATUS" != "running" ]; then
    echo "❌ $R : NOT RUNNING"
    PASS=0
else
    echo "✅ $R : RUNNING"
fi

done

echo

if [ $PASS -eq 0 ]; then
    echo "Lab verification FAILED."
    exit
fi

echo

for R in "${ROUTERS[@]}"
do

echo "Checking FRR on $R..."

docker exec $R ps | grep zebra >/dev/null

if [ $? -eq 0 ]; then
    echo "   ✅ Zebra Running"
else
    echo "   ❌ Zebra NOT Running"
fi

docker exec $R ps | grep ospfd >/dev/null

if [ $? -eq 0 ]; then
    echo "   ✅ OSPF Running"
else
    echo "   ❌ OSPF NOT Running"
fi

done

echo
echo "Verification Finished."