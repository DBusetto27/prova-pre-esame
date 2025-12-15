#!/bin/bash
cd /var/www/node-app
# Avvia l'app e la chiama "NodeApp"
pm2 start app.js --name "NodeApp" --update-env
# Salva la lista dei processi per il riavvio automatico
pm2 save