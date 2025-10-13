apt-get update
apt-get install ifupdown -y

# Tirion (ns1 / master)
apt-get update
apt-get install ifupdown -y

apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

mkdir -p /etc/bind/K49

cat > /etc/bind/named.conf.local <<'EOF'
zone "jarkomK49.com" {
    type master;
    notify yes;
    also-notify { 10.88.3.4; };      // IP Valmar (ns2)
    allow-transfer { 10.88.3.4; };
    file "/etc/bind/K49/jarkomK49.com";
};
EOF

cat > /etc/bind/zone.template<<'EOF'
$TTL     604800          ; Waktu cache default (detik)
@        IN      SOA     localhost. root.localhost. (
                         2025101302 ; Serial (format YYYYMMDDXX)
                         604800     ; Refresh (1 minggu)
                         86400      ; Retry (1 hari)
                         2419200    ; Expire (4 minggu)
                         604800 )   ; Negative Cache TTL
;

@        IN      NS      localhost.
@        IN      A       127.0.0.1
EOF

cat > /etc/bind/K49/jarkomK49.com<<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
            2025101302 ; Serial YYYYMMDDXX
            604800     ; Refresh 1 minggu
            86400      ; Retry 1 hari
            2419200    ; Expire 4 minggu
            604800 )   ; Negative Cache TTL

@       IN NS ns1.jarkomK49.com.
@       IN NS ns2.jarkomK49.com.
@       IN A 10.88.3.2       ; Apex domain mengarah ke Sirion (front door)

; Records A
ns1     IN A 10.88.3.3
ns2     IN A 10.88.3.4
Earendil IN A 10.88.1.2
Elwing   IN A 10.88.1.3
Cidran   IN A 10.88.2.2
Elrond   IN A 10.88.2.3
Maglor   IN A 10.88.2.4
Sirion   IN A 10.88.3.2
Lindon   IN A 10.88.3.5
Vingilot IN A 10.88.3.6

; Alias / CNAME
www      IN CNAME Sirion.jarkomK49.com.
static   IN CNAME Lindon.jarkomK49.com.
app      IN CNAME Vingilot.jarkomK49.com.
EOF

cat > /etc/bind/named.conf.options <<'EOF'
options {
    directory "/var/cache/bind";
    dnssec-validation no;
    forwarders { 192.168.122.1; };
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};
EOF

service bind9 restart

# Valmar (ns2 / slave)
apt-get update
apt-get install ifupdown -y
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

mkdir -p /etc/bind/K49

cat > /etc/bind/named.conf.local <<'EOF'
zone "jarkomK49.com" {
    type slave;
    masters { 10.88.3.3; };           // IP Tirion / ns1
    file "/etc/bind/K49/jarkomK49.com";
};
EOF

cat > /etc/bind/named.conf.options <<'EOF'
options {
    directory "/var/cache/bind";
    dnssec-validation no;
    forwarders { 192.168.122.1; };
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};
EOF

service bind9 restart
