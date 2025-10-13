# Tirion (ns1 / master)
# Tambahkan zona reverse baru di named.conf.local
cat >> /etc/bind/named.conf.local <<'EOF'

zone "3.88.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.88.3.4; };       // IP Valmar (ns2)
    allow-transfer { 10.88.3.4; };
    file "/etc/bind/K49/db.10.88.3";
};
EOF

# Buat file zona reverse /etc/bind/K49/db.10.88.3
cat > /etc/bind/K49/db.10.88.3 <<'EOF'
$TTL 604800
@       IN      SOA     ns1.jarkomK49.com. root.jarkomK49.com. (
                        2025101303 ; Serial YYYYMMDDXX (Serial dinaikkan)
                        604800     ; Refresh
                        86400      ; Retry
                        2419200    ; Expire
                        604800 )   ; Negative Cache TTL

@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

; PTR Records untuk Layanan di DMZ (10.88.3.x)
2       IN      PTR     sirion.jarkomK49.com.   ; 10.88.3.2
3       IN      PTR     ns1.jarkomK49.com.      ; 10.88.3.3
4       IN      PTR     ns2.jarkomK49.com.      ; 10.88.3.4
5       IN      PTR     lindon.jarkomK49.com.   ; 10.88.3.5
6       IN      PTR     vingilot.jarkomK49.com. ; 10.88.3.6
EOF

service bind9 restart


# Valmar (ns2 / slave)
# Tambahkan zona reverse slave baru di named.conf.local
cat >> /etc/bind/named.conf.local <<'EOF'

zone "3.88.10.in-addr.arpa" {
    type slave;
    masters { 10.88.3.3; };       // IP Tirion / ns1
    file "/etc/bind/K49/db.10.88.3";
};
EOF

# Ubah kepemilikan dan hak akses (penting untuk slave)
chown -R bind:bind /etc/bind/K49
chmod 755 /etc/bind/K49

service bind9 restart


# Di client manapun
# Verifikasi Sirion
dig -x 10.88.3.2 +short

# Verifikasi Lindon
dig -x 10.88.3.5 +short

# Verifikasi Vingilot
dig -x 10.88.3.6 +short
