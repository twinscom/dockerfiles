#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

tar -czpf "/backups/${BACKUP_NAME:-backup.tar.gz}" "${FILE}"
