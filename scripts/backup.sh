#!/bin/bash
# backup.sh - create a compressed backup of a directory

SOURCE=$1
BACKUP_DIR=/var/backups/toolkit
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE=$BACKUP_DIR/backup_$DATE.tar.gz

mkdir -p $BACKUP_DIR
tar -czf $ARCHIVE $SOURCE
echo "Backup created: $ARCHIVE"
