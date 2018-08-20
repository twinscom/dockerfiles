#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

BACKUP_PATH="/backups/${BACKUP_NAME:-backup.tar.gz}"

rm "$BACKUP_PATH"

pg_dumpall \
    "--host=${HOST:-postgres}" \
    "--port=${PORT:-5432}" \
    "--username=${USERNAME:-postgres}" \
    "--file=$BACKUP_PATH"
