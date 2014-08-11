#!/bin/sh

# Set timezone
echo "America/New_York" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
