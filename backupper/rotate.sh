#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

BACKUPS_DIR='/backups/'

TOTAL_BACKUPS=$(find "$BACKUPS_DIR" -mindepth 1 -maxdepth 1 | wc -l)

if [ "$TOTAL_BACKUPS" -gt "${MAX_BACKUPS:-45}" ]; then
    OLDEST_BACKUP=$(find "$BACKUPS_DIR" -mindepth 1 -maxdepth 1 | sort | head -n 1)
    rm -rf "$OLDEST_BACKUP"
fi
