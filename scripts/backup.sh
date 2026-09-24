#!/usr/bin/env bash
# backup.sh - Create a timestamped compressed backup of a directory
# Usage: ./scripts/backup.sh <source_dir>
# Env:   BACKUP_DIR - where to store archives
#        (default: /srv/backups for root, $HOME/backups for other users)
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <source_dir>" >&2
    exit 1
fi

if [[ $EUID -eq 0 ]]; then
    DEFAULT_BACKUP_DIR="/srv/backups"
else
    DEFAULT_BACKUP_DIR="$HOME/backups"
fi

SOURCE="$1"
BACKUP_DIR="${BACKUP_DIR:-$DEFAULT_BACKUP_DIR}"
DATE="$(date +%Y-%m-%d_%H-%M-%S)"
ARCHIVE="${BACKUP_DIR}/backup_$(basename "$SOURCE")_${DATE}.tar.gz"

if [[ ! -d "$SOURCE" ]]; then
    echo "Error: source directory '$SOURCE' does not exist" >&2
    exit 1
fi

mkdir -p "$BACKUP_DIR"
tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"
echo "Backup created: $ARCHIVE"
