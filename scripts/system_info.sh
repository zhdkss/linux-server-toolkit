#!/usr/bin/env bash
# system_info.sh - Display basic information about the Linux host
# Usage: ./scripts/system_info.sh
set -euo pipefail

print_section() {
    printf '\n=== %s ===\n' "$1"
}

print_section "Host"
echo "Hostname : $(hostname)"
echo "Kernel   : $(uname -r)"
if [[ -f /etc/os-release ]]; then
    # shellcheck disable=SC1091
    . /etc/os-release
    echo "OS       : ${PRETTY_NAME:-unknown}"
fi
echo "Uptime   : $(uptime -p 2>/dev/null || echo unknown)"

print_section "CPU"
echo "Cores    : $(nproc 2>/dev/null || echo unknown)"
echo "Load avg : $(cut -d ' ' -f1-3 /proc/loadavg 2>/dev/null || echo unknown)"

print_section "Memory"
free -h 2>/dev/null || echo "free command not available"

print_section "Disk"
df -h / 2>/dev/null || echo "df command not available"
