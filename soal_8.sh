#Tirion
nano /etc/bind/named.conf.local
zone "3.88.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.88.3.4; };
    allow-transfer { 10.88.3.4; };
    file "/etc/bind/arda/3.88.10.in-addr.arpa";
};
nano /etc/bind/K49/3.88.10.in-addr.arpa
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
            2          ; Serial
            604800     ; Refresh 1 minggu
            86400      ; Retry 1 hari
            2419200    ; Expire 4 minggu
            604800 )   ; Negative Cache TTL

3.88.10.in-addr.arpa  IN NS  ns1.jarkomK49.com.
2                     IN PTR Sirion.jarkomK49.com.
5                     IN PTR Lindon.jarkomK49.com.
6                     IN PTR Vingilot.jarkomK49.com.
service bind9 restart  
