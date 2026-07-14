#!/bin/bash

#############################################
# Cognitive ASA Research Lab
# Experiment Launcher
#############################################

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ $# -eq 0 ]; then
    echo "Usage:"
    echo "./run_experiment.sh <experiment_number>"
    echo
    echo "Example:"
    echo "./run_experiment.sh 04"
    exit 1
fi

EXP=$(printf "%02d" "$1")

echo "==============================================="
echo " Launching Experiment $EXP"
echo "==============================================="
echo

case "$EXP" in

01)
TITLE="Traditional Network Architecture using Mininet"
;;

02)
TITLE="Static Routing"
;;

03)
TITLE="Dynamic Routing using OSPF"
;;

04)
TITLE="Network Monitoring & Performance Analysis"
;;

05)
TITLE="Python Network Automation"
;;

06)
TITLE="Open vSwitch"
;;

07)
TITLE="Ryu Controller"
;;

08)
TITLE="Policy-Based Networking"
;;

09)
TITLE="Autonomic Service Agent"
;;

10)
TITLE="Agent Discovery & Negotiation"
;;

11)
TITLE="Cognitive ASA"
;;

12)
TITLE="Evaluation & Comparison"
;;

*)
echo "Invalid Experiment."
exit 1
;;

esac

echo "Experiment : $EXP"
echo "Title      : $TITLE"

echo
echo "Preparing Lab..."

"$SCRIPT_DIR/start_lab.sh"

echo
"$SCRIPT_DIR/verify_lab.sh"

echo
echo "==============================================="
echo " Lab Ready"
echo "==============================================="
echo
echo "Open the experiment folder:"
echo
echo "experiments/experiment$EXP"
echo
echo "Good Luck!"