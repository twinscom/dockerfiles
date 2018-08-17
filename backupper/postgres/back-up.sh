#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

pg_dumpall \
    "--host=${HOST:-postgres}" \
    "--port=${PORT:-5432}" \
    "--username=${USERNAME:-postgres}" \
    "--file=/backups/${BACKUP_NAME:-postgres-backup.sql}"
