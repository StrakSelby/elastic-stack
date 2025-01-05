#!/bin/bash
echo "Run docker on Ubuntu 24.04"
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
systemctl --user restart docker-desktop.service