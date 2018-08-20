#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

chmod 644 /etc/logrotate.d/*
chown root:root /etc/logrotate.d/*

touch "/backups/${BACKUP_NAME:-backup.tar.gz}"

exec crond -f
