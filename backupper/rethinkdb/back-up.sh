#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

rethinkdb dump \
    --connect "${HOST:-rethinkdb}:${PORT:-28015}" \
    --export "${DB:-test}" \
    --file "/backups/${BACKUP_NAME:-rethinkdb-backup.tar.gz}"
