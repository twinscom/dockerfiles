#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

chmod 644 /etc/logrotate.d/*
chown root:root /etc/logrotate.d/*

BACKUP_PATH="/backups/${BACKUP_NAME:-postgres-backup.sql}"

if [ ! -f "$BACKUP_PATH" ]; then
    touch "$BACKUP_PATH"
fi

exec crond -f
