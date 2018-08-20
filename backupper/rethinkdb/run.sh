#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

touch "/backups/${BACKUP_NAME:-rethinkdb-backup.tar.gz}"

exec cron -f
