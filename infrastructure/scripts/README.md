# 🛠️ Cognitive ASA Lab Management Toolkit

This directory contains utility scripts used to manage, monitor, verify, and maintain the **Cognitive Autonomic Service Agent (C-ASA) Research Lab**.

The toolkit simplifies day-to-day operations such as starting the lab, validating network health, collecting logs, backing up configurations, and preparing experiments.

---

# Directory Structure

```
scripts/
│
├── start_lab.sh
├── stop_lab.sh
├── restart_lab.sh
├── verify_lab.sh
├── health_check.sh
│
├── cleanup.sh
├── reset_lab.sh
│
├── backup_configs.sh
├── restore_configs.sh
│
├── collect_logs.sh
├── diagnose.sh
├── monitor.sh
│
├── prepare_experiment.sh
├── run_experiment.sh
└── experiment_status.sh
```

---

# Script Overview

## start_lab.sh

Starts the complete Docker-based Cognitive ASA laboratory.

### Usage

```bash
./start_lab.sh
```

---

## stop_lab.sh

Stops all running lab containers and services safely.

### Usage

```bash
./stop_lab.sh
```

---

## restart_lab.sh

Stops and restarts the complete laboratory environment.

### Usage

```bash
./restart_lab.sh
```

---

## verify_lab.sh

Verifies whether the laboratory is ready for experiments.

Checks include:

- Docker Engine
- Running Containers
- Router Availability
- FRR Services
- OSPF
- Routes
- Network Status

### Usage

```bash
./verify_lab.sh
```

---

## health_check.sh

Displays detailed health information for every router.

Includes:

- Container Status
- Interfaces
- IP Addresses
- Routing Tables
- OSPF Neighbors
- Interface Statistics

### Usage

```bash
./health_check.sh
```

---

## cleanup.sh

Performs safe Docker cleanup.

Removes:

- Stopped Containers
- Unused Networks
- Dangling Images
- Build Cache
- Unused Volumes

### Usage

```bash
./cleanup.sh
```

---

## reset_lab.sh

Resets the complete laboratory.

Performs:

1. Stop Containers
2. Remove Orphan Containers
3. Cleanup Docker Resources
4. Restart Lab
5. Verify Environment

### Usage

```bash
./reset_lab.sh
```

---

## backup_configs.sh

Creates a timestamped backup of router configurations.

Backs up:

- FRRouting Configuration
- IP Configuration
- Routing Table
- Docker Inspection Information

Backups are stored inside:

```
scripts/backup/
```

### Usage

```bash
./backup_configs.sh
```

---

## restore_configs.sh

Restores the most recent router configuration backup.

### Usage

```bash
./restore_configs.sh
```

---

## collect_logs.sh

Collects diagnostic information from every router.

Includes:

- Docker Logs
- Routes
- Interface Statistics
- OSPF Information
- Running Processes

Logs are stored inside:

```
scripts/logs/
```

### Usage

```bash
./collect_logs.sh
```

---

## diagnose.sh

Automatically diagnoses common laboratory problems.

Checks:

- Docker Status
- Router Status
- FRR Processes
- Zebra
- OSPF
- IP Forwarding
- Routing

### Usage

```bash
./diagnose.sh
```

---

## monitor.sh

Provides continuous live monitoring.

Displays:

- Docker Statistics
- Interface Statistics
- Routes
- Container Status

Refresh Interval:

Every 5 seconds.

Stop monitoring using:

```
CTRL + C
```

### Usage

```bash
./monitor.sh
```

---

## prepare_experiment.sh

Prepares the environment before running any experiment.

Performs:

- Docker Validation
- Router Verification
- Network Verification
- Environment Readiness Check

### Usage

```bash
./prepare_experiment.sh
```

---

## run_experiment.sh

Launches a selected experiment.

Example:

```bash
./run_experiment.sh 04
```

Supported Experiments:

| Experiment | Description |
|------------|-------------|
| 01 | Traditional Network |
| 02 | Static Routing |
| 03 | Dynamic Routing (OSPF) |
| 04 | Network Monitoring |
| 05 | Python Automation |
| 06 | Open vSwitch |
| 07 | Ryu Controller |
| 08 | Policy-Based Networking |
| 09 | Autonomic Service Agent |
| 10 | Agent Discovery |
| 11 | Cognitive ASA |
| 12 | Evaluation |

---

## experiment_status.sh

Displays the overall progress of the Cognitive ASA laboratory.

Shows:

- Completed Experiments
- Running Experiment
- Pending Experiments
- Overall Completion Percentage

### Usage

```bash
./experiment_status.sh
```

---

# Typical Workflow

Before starting an experiment:

```bash
./prepare_experiment.sh
```

Launch experiment:

```bash
./run_experiment.sh 04
```

Verify environment:

```bash
./verify_lab.sh
```

Monitor the laboratory:

```bash
./monitor.sh
```

Check detailed health:

```bash
./health_check.sh
```

Collect logs:

```bash
./collect_logs.sh
```

Backup configuration:

```bash
./backup_configs.sh
```

Reset laboratory if required:

```bash
./reset_lab.sh
```

Stop laboratory:

```bash
./stop_lab.sh
```

---

# Requirements

- Docker Engine
- Docker Compose
- FRRouting Containers
- Linux Host (Ubuntu Recommended)

---

# Research Project

**Project Title**

**Cognitive Autonomic Networking: Extending ANIMA Through Agentic AI and Semantic Agent-to-Agent Communication**

This toolkit supports the implementation, experimentation, and evaluation of the Cognitive Autonomic Service Agent (C-ASA) research platform.

---

© Cognitive ASA Research Lab