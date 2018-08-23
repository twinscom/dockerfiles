#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

rethinkdb-dump \
    --connect "${HOST:-rethinkdb}:${PORT:-28015}" \
    --export "${DB:-test}" \
    --file "/backups/$(date +'%Y-%m-%dT%H:%M:%S').tar.gz"

exec /rotate.sh
