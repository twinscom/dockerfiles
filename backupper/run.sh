#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

echo "${SCHEDULE:-0 0 * * *} /back-up.sh > /proc/1/fd/1 2> /proc/1/fd/2" \
    > /var/spool/cron/crontabs/root

exec crond -f
