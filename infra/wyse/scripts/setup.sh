#!/bin/bash

echo "Setting up a service to auto-run docker compose at start-up"
sudo bash -c 'cat > /etc/systemd/system/wyse-services.service << "EOF"
[Unit]
Description=Docker Compose for Wyse Homelab Infra
After=docker.service network-online.target
Wants=network-online.target
Requires=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=/home/wyse/new_homelab/infra/wyse
ExecStart=/usr/bin/docker compose up -d
ExecStop=/usr/bin/docker compose down
User=wyse
Group=wyse
Restart=no

[Install]
WantedBy=multi-user.target
EOF'

sudo systemctl daemon-reload
sudo systemctl enable --now wyse-services.service

echo "Setting up a persistent IP of 192.168.1.254"
sudo bash -c 'cat > /etc/systemd/network/enp1s0-ethernet.network << "EOF"
[Match]
Name=enp1s0

[Network]
Address=192.168.1.254/24
Gateway=192.168.1.1
DNS=1.1.1.1
EOF'

sudo systemctl restart systemd-networkd