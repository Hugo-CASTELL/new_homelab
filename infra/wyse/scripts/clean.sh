#!/bin/bash

# Persistent IP
sudo rm /etc/systemd/network/enp1s0-ethernet.network
sudo systemctl restart systemd-networkd

# Disable auto-run of docker compose
sudo systemctl disable --now wyse-services.service
sudo rm /etc/systemd/system/wyse-services.service
sudo systemctl daemon-reload

# Deleting secrets
sudo rm /mnt/secrets/*