# Lindon

apt update
apt install nginx -y

cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.3   
nameserver 10.88.3.4 
nameserver 192.168.122.1 
EOF

# Buat folder arsip dan file dummy
mkdir -p /var/www/html/annals/
echo "Konten Arsip 1" > /var/www/html/annals/arsip_1.txt
echo "Konten Arsip 2" > /var/www/html/annals/arsip_2.txt

# Konfigurasi Nginx untuk static.jarkomK49.com dengan autoindex
cat > /etc/nginx/sites-available/static.conf <<'EOF'
server {
    listen 80;
    server_name static.jarkomK49.com;
    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    # Konfigurasi khusus untuk folder /annals/
    location /annals/ {
        autoindex on; # Mengaktifkan directory listing
    }
}
EOF

# Aktifkan konfigurasi
ln -s /etc/nginx/sites-available/static.conf /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

# Restart Nginx
service nginx restart


# tes di client timur / barat
curl http://static.jarkomK49.com/annals/
