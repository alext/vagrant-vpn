#!/bin/sh

set -eu

exec sshuttle --python python3 -e 'vagrant ssh' -r default "$@"
