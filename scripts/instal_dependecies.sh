#!/bin/bash
# Aggiorna apt
sudo apt-get update

# Installa Node.js e NPM (versione LTS)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Installa PM2 globalmente (per gestire il processo node)
sudo npm install -g pm2

# Installa Nginx (Reverse Proxy - Richiesta Bonus)
sudo apt-get install -y nginx

# Configura Nginx (Reverse Proxy: 80 -> 3000)
# Scrive una config brutale sovrascrivendo quella di default
sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80;
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF'

# Riavvia Nginx per applicare le modifiche
sudo service nginx restart