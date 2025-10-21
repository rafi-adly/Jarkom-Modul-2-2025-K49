# Vingilot
nano /etc/nginx/sites-available/app.conf

# tambahkan ini ke dalam server { ... }
access_log /var/log/nginx/access.log main;

nginx -t
sever nginx stop
server nginx start

tail /var/log/nginx/access.log

# Di client
curl http://www.jarkomK49.com/app/
