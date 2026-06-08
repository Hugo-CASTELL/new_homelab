#!/bin/bash

# Secrets creation
echo "Creation of Pi-hole Web Password: visit /run/secrets/pihole_web_password"
echo "CHANGE_THIS" > /run/secrets/pihole_web_password

# Persistent IP
sudo bash -c 'cat > /etc/systemd/network/enp1s0-ethernet.network << "EOF"
[Match]
Name=enp1s0

[Network]
Address=192.168.1.254/24
Gateway=192.168.1.1
DNS=192.168.1.254
EOF'

sudo systemctl restart systemd-networkd

# Run docker compose
sudo bash -c 'cat > /etc/systemd/system/wyse-services.service << "EOF"
[Unit]
Description=Docker Compose for Wyse Homelab Infra
After=docker.service
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