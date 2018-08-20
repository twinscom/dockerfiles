#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

BACKUP_PATH="/backups/${BACKUP_NAME:-backup.tar.gz}"

rm "$BACKUP_PATH"

tar -czpf "$BACKUP_PATH" "${FILE}"
