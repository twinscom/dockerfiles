#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

SCRIPTS_DIR=$(dirname "$0")

"$SCRIPTS_DIR/back-up.sh" > /proc/1/fd/1 2> /proc/1/fd/2
