# Troubleshooting Guide

## `$'\r': command not found`
**Cause:** the script has Windows (CRLF) line endings.
**Fix:** the repository enforces LF via `.gitattributes`. Re-clone, or run `dos2unix scripts/*.sh`.

## `Permission denied` when running a script
**Cause:** the file is not executable.
**Fix:** `chmod +x scripts/*.sh`, or run with `bash scripts/<name>.sh`.

## `backup.sh`: cannot create backup directory
**Cause:** a non-root user cannot write to `/srv/backups`.
**Fix:** run without root (uses `$HOME/backups`) or set `BACKUP_DIR` to a writable path.

## `disk_monitor.sh` never shows a warning
**Check:** the threshold printed in the output. It must be between 1 and 100.
Override with `DISK_THRESHOLD=80 ./scripts/disk_monitor.sh`.

## General debugging steps
1. Check syntax: `bash -n scripts/<name>.sh`
2. Trace execution: `bash -x scripts/<name>.sh`
3. Lint: `shellcheck scripts/<name>.sh`
4. Find when a line changed: `git log -p -- <file>` and `git blame <file>`
