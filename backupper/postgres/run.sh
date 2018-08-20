#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

touch "/backups/${BACKUP_NAME:-postgres-backup.sql}"

exec crond -f
