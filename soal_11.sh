# Sirion

apt update && apt install nginx apache2-utils -y

# Menggunakan DUA Server Block untuk stabilitas (BLOK 1: Redirect, BLOK 2: Proxy)
cat > /etc/nginx/sites-available/reverse_proxy.conf <<'EOF'

# BLOK 1: REDIRECT HOSTNAME NON-KANONIK (sirion.jarkomK49.com)
server {
    listen 80;
    server_name sirion.jarkomK49.com;
    
    # Redirect 301 yang aman ke hostname kanonik
    return 301 http://www.jarkomK49.com$request_uri;
}


# BLOK 2: HOSTNAME KANONIK & REVERSE PROXY (www.jarkomK49.com)
server {
    listen 80;
    server_name www.jarkomK49.com;
    
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

ln -sf /etc/nginx/sites-available/reverse_proxy.conf /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t
service nginx restart

# Di client
curl -I http://sirion.jarkomK49.com

curl http://www.jarkomK49.com/static/annals/

curl http://www.jarkomK49.com/app/about
