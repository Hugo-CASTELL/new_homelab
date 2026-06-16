# Secrets creation
sudo mkdir -p /mnt/secrets/

echo "Creation of Pi-hole Web Password: visit /mnt/secrets/pihole_web_password"
echo "CHANGE_THIS" | sudo tee /mnt/secrets/pihole_web_password > /dev/null