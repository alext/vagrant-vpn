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
