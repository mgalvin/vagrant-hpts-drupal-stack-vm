#!/bin/sh

# Upgrade the system before setting up our custom environment
sudo apt-get update

# This full command uses apt-get but force's a full noninteractive mode.
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
