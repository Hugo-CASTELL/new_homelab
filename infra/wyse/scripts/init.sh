# Secrets creation
sudo mkdir -p /run/secrets/

echo "Creation of Pi-hole Web Password: visit /run/secrets/pihole_web_password"
echo "CHANGE_THIS" | sudo tee /run/secrets/pihole_web_password > /dev/null