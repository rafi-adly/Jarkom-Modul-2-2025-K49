# SIRION
echo "--- 1. Tambah Redirect IP 10.88.3.2 ---"

# Menyisipkan server block baru di baris pertama file reverse_proxy.conf
sed -i '1s/^/server {\n    listen 80;\n    server_name 10.88.3.2; \n\n    return 301 http:\/\/www.jarkomK49.com\$request_uri;\n}\n\n/' /etc/nginx/sites-available/reverse_proxy.conf

nginx -t
service nginx restart
