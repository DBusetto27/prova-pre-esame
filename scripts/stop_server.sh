#!/bin/bash
# Ferma tutti i processi PM2. 
# || true serve per non far fallire lo script se non c'è nulla da fermare (primo deploy)
pm2 stop all || true