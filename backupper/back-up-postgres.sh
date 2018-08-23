#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

PGHOST=${PGHOST:-postgres}
PGPORT=${PGPORT:-5432}
PGUSER=${PGUSER:-postgres}

BACKUP_FILE="/backups/$(date +'%Y-%m-%dT%H:%M:%S').sql"

pg_dumpall \
    "--host=$PGHOST" \
    "--port=$PGPORT" \
    "--username=$PGUSER" \
    "--file=$BACKUP_FILE"

gzip -9 "$BACKUP_FILE"

exec /rotate.sh
