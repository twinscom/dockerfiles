#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

BACKUP_PATH="/backups/${BACKUP_NAME:-rethinkdb-backup.tar.gz}"

rm "$BACKUP_PATH"

rethinkdb dump \
    --connect "${HOST:-rethinkdb}:${PORT:-28015}" \
    --export "${DB:-test}" \
    --file "$BACKUP_PATH"
