# Sirion

htpasswd -c /etc/nginx/htpasswd.sirion admin
# CATATAN: Masukkan password 'sirionpass' saat diminta.

nano /etc/nginx/sites-available/reverse_proxy.conf
# menambahkan ini setelah location /app
location /admin/ {
        auth_basic "Sirion Admin Area";
        auth_basic_user_file /etc/nginx/htpasswd.sirion;
        
        proxy_pass http://10.88.3.6/admin/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_redirect off;
    }

# PERMISSION 
chmod 644 /etc/nginx/htpasswd.sirion
chown www-data:www-data /etc/nginx/htpasswd.sirion

nginx -t
service nginx stop
service nginx start

netstat -tuln | grep 80


# Di Client
# HOST: Klien (Cirdan/Erlond)
curl -I http://www.jarkomK49.com/admin/
# HTTP/1.1 401 Authorization Required

curl -u admin:sirionpass http://www.jarkomK49.com/admin/
# status 404 atau 200
