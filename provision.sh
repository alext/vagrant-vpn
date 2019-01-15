#!/bin/sh

set -eu

export DEBIAN_FRONTEND=noninteractive

# Unneeded and only uses up RAM
apt-get -q -y remove snapd --purge

apt-get -q update
apt-get -q -y upgrade
apt-get -q -y autoremove --purge

# ClamAV required by some hostscan profiles
apt-get -y -q install clamav-daemon

## Install anyconnect

# Cisco installer attempts to write to these directories.
mkdir -p /usr/share/icons/hicolor/128x128/apps/
mkdir -p /usr/share/desktop-directories/

for file in /vagrant/anyconnect-linux64-*.sh; do
  echo "installing anyconnect from ${file}"
  sh "${file}"
  break # Avoid installing multiple versions...
done
