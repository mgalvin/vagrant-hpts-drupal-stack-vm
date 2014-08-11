#!/bin/sh

# Install the build-essential tools
sudo apt-get update

# This full command uses apt-get but force's a full noninteractive mode.
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install build-essential
