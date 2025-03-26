#!/bin/bash

BACKUP_DIR="/path/to/backup"
DEST_DIR="/path/to/destination"
LOG_FILE="/var/log/backup.log"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
TAR_FILE="backup_$DATE.tar.gz"

echo "Starting backup at $(date)" | tee -a "$LOG_FILE"

tar -czf "$DEST_DIR/$TAR_FILE" "$BACKUP_DIR" 2>> "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "Backup successful: $TAR_FILE" | tee -a "$LOG_FILE"
else
    echo "Backup failed!" | tee -a "$LOG_FILE"
fi
