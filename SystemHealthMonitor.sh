#!/bin/bash

LOG_FILE="system_health.log"

echo "Monitoring system resources..." > "$LOG_FILE"

while true; do
    echo "Timestamp: $(date)" >> "$LOG_FILE"
    echo "CPU Load: $(top -l 1 | grep 'CPU usage')" >> "$LOG_FILE"
    echo "Memory: $(top -l 1 | grep PhysMem)" >> "$LOG_FILE"
    echo "Disk Space: $(df -h / | awk 'NR==2')" >> "$LOG_FILE"
    echo "--------------------------" >> "$LOG_FILE"
    sleep 10  # Check every 10 seconds
done
