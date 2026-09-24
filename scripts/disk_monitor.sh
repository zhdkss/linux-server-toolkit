#!/usr/bin/env bash
# disk_monitor.sh - Warn when disk usage exceeds a threshold
# Usage: ./scripts/disk_monitor.sh [mount_point]
# Env:   DISK_THRESHOLD - warning threshold in percent (default: 90)
set -euo pipefail

MOUNT_POINT="${1:-/}"
THRESHOLD="${DISK_THRESHOLD:-90}"

USAGE="$(df -P "$MOUNT_POINT" | awk 'NR==2 {gsub("%", "", $(NF-1)); print $(NF-1)}')"

if (( USAGE >= THRESHOLD )); then
    echo "WARNING: disk usage on $MOUNT_POINT is ${USAGE}% (threshold ${THRESHOLD}%)"
    exit 2
fi

echo "OK: disk usage on $MOUNT_POINT is ${USAGE}% (threshold ${THRESHOLD}%)"
