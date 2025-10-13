# Sirion

# Instalasi Nginx
apt update
apt install nginx -y

# Konfigurasi Nginx untuk reverse proxy
cat > /etc/nginx/sites-available/reverse_proxy.conf <<'EOF'
server {
    listen 80;
    server_name www.jarkomK49.com sirion.jarkomK49.com;

    # Penanganan Kanonik (sirion.com -> www.com)
    if ($host = 'sirion.jarkomK49.com') {
        return 301 http://www.jarkomK49.com$request_uri;
    }

    # Routing: /static -> Lindon (10.88.3.5)
    location /static/ {
        proxy_pass http://10.88.3.5/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_redirect off;
    }

    # Routing: /app -> Vingilot (10.88.3.6)
    location /app/ {
        proxy_pass http://10.88.3.6/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_redirect off;
    }
    
    # Default 404
    location / {
        return 404 "Sirion: Endpoint tidak ditemukan. Coba /static/annals/ atau /app/.";
    }
}
EOF

# Aktifkan konfigurasi
ln -sf /etc/nginx/sites-available/reverse_proxy.conf /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Restart Nginx
service nginx restart

# Di client
curl -I http://sirion.jarkomK49.com

curl http://www.jarkomK49.com/static/annals/

curl http://www.jarkomK49.com/app/about
