#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

tar -czpf "/backups/$(date +'%Y-%m-%dT%H:%M:%S').tar.gz" "${FILE}"

exec /rotate.sh
