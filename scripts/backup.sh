#!/usr/bin/env bash
# backup.sh - Create a timestamped compressed backup of a directory
# Usage: ./scripts/backup.sh <source_dir>
# Env:   BACKUP_DIR - where to store archives (default: $HOME/backups)
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <source_dir>" >&2
    exit 1
fi

SOURCE="$1"
BACKUP_DIR="${BACKUP_DIR:-$HOME/backups}"
DATE="$(date +%Y-%m-%d_%H-%M-%S)"
ARCHIVE="${BACKUP_DIR}/backup_$(basename "$SOURCE")_${DATE}.tar.gz"

if [[ ! -d "$SOURCE" ]]; then
    echo "Error: source directory '$SOURCE' does not exist" >&2
    exit 1
fi

mkdir -p "$BACKUP_DIR"
tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"
echo "Backup created: $ARCHIVE"
