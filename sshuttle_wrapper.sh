#!/bin/sh

set -eu

if [ ! -f "./vpn_ip" ]; then
  echo "./vpn_ip file missing. Have you run 'make vpn_connect'"
  exit 1
fi

VPN_IP=$(cat ./vpn_ip)

exec sshuttle --python python3 -e 'vagrant ssh' -r default -x "${VPN_IP}/32" "$@"
