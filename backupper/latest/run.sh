#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

touch "/backups/${BACKUP_NAME:-backup.tar.gz}"

exec crond -f
