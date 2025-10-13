# Vingilot
apt update
apt install nginx php8.4-fpm -y

mkdir -p /var/www/html/app.jarkomK49.com/
# index.php (Beranda)
cat > /var/www/html/app.jarkomK49.com/index.php <<'EOF'
<?php 
    echo "<h1>Vingilot <3</h1>";
    echo "<p>Kapal web dinamis.</p>";
    echo "<ul>";
    echo "<li><a href='/about'>Pergi ke Halaman About (Menguji Rewrite)</a></li>";
    echo "</ul>";
?>
EOF

# about.php (Menguji Rewrite)
cat > /var/www/html/app.jarkomK49.com/about.php <<'EOF'
<?php 
    echo "<h1>Tentang Vingilot</h1>";
    echo "<p>Vingilot123 test test.</p>";
    echo "<a href='/'>Kembali ke Beranda</a>"; 
?>
EOF

# Konfigurasi Nginx untuk app.jarkomK49.com
cat > /etc/nginx/sites-available/app.conf <<'EOF'
server {
    listen 80;
    server_name app.jarkomK49.com;
    root /var/www/html/app.jarkomK49.com;
    index index.php index.html;

    # Konfigurasi PHP-FPM
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock; # Sesuaikan socket jika perlu
    }

    # Terapkan rewrite untuk /about (menghapus .php)
    location / {
        try_files $uri $uri/ $uri.php?$args;
    }
}
EOF

# Aktifkan konfigurasi
ln -sf /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Restart Nginx dan PHP-FPM
service php8.4-fpm restart
service nginx restart

# tes di client
curl http://app.jarkomK49.com
curl http://app.jarkomK49.com/about
