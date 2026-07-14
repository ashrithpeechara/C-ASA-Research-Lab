#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Experiment Progress Dashboard
#############################################

TOTAL=12

COMPLETED=4

PERCENT=$((COMPLETED*100/TOTAL))

echo "==============================================="
echo " Cognitive ASA Research Progress"
echo "==============================================="

echo

printf "%-5s %-45s %-10s\n" "No." "Experiment" "Status"

echo "-----------------------------------------------------------------------"

printf "%-5s %-45s %-10s\n" "01" "Traditional Network" "DONE"

printf "%-5s %-45s %-10s\n" "02" "Static Routing" "DONE"

printf "%-5s %-45s %-10s\n" "03" "Dynamic Routing (OSPF)" "DONE"

printf "%-5s %-45s %-10s\n" "04" "Monitoring & Performance" "ONGOING"

printf "%-5s %-45s %-10s\n" "05" "Python Automation" "PENDING"

printf "%-5s %-45s %-10s\n" "06" "Open vSwitch" "PENDING"

printf "%-5s %-45s %-10s\n" "07" "Ryu Controller" "PENDING"

printf "%-5s %-45s %-10s\n" "08" "Policy-Based Networking" "PENDING"

printf "%-5s %-45s %-10s\n" "09" "Autonomic Service Agent" "PENDING"

printf "%-5s %-45s %-10s\n" "10" "Agent Discovery" "PENDING"

printf "%-5s %-45s %-10s\n" "11" "Cognitive ASA" "PENDING"

printf "%-5s %-45s %-10s\n" "12" "Evaluation" "PENDING"

echo
echo "----------------------------------------------------"

echo "Completed : $COMPLETED / $TOTAL"

echo "Progress  : $PERCENT %"

echo
echo "==============================================="