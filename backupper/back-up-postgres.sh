#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

PGHOST=${PGHOST:-postgres}
PGUSER=${PGUSER:-postgres}

BACKUP_FILE="/backups/$(date +'%Y-%m-%dT%H:%M:%S').sql"

pg_dumpall "--file=$BACKUP_FILE"

gzip -9 "$BACKUP_FILE"

exec /rotate.sh
