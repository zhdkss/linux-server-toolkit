# Configuration Guide

Scripts are configured with environment variables, so no files need to be edited.

| Variable     | Script      | Default        | Description                  |
|--------------|-------------|----------------|------------------------------|
| `BACKUP_DIR` | `backup.sh` | `/srv/backups` | Where archives are stored    |

## Example

~~~bash
BACKUP_DIR=/mnt/storage/backups ./scripts/backup.sh /etc
~~~

## Recommendations
- Store backups on a separate disk or mount point.
- Restrict access: `chmod 700` on the backup directory.
