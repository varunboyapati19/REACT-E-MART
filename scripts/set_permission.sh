sudo chown -R nginx:nginx /usr/share/nginx/html/REACT-E-MART
sudo find /usr/share/nginx/html/REAcT-E-MART -type d -exec chmod 755 {} \;
sudo find /usr/share/nginx/html/REACT-E-MART -type f -exec chmod 644 {} \;
sudo chmod +x /usr/share/nginx/html/REACT-E-MART/scripts/*.sh
