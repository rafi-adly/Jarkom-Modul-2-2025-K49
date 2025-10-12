#Tirion
apt-get install && apt-get update bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9
vim /etc/bind/named.conf.local
echo zone "K49.com" {
	type master;
	notify yes;
    	also-notify { 10.88.3.4; };
    	allow-transfer { 10.88.3.4; };
	file "/etc/bind/K49/K49.com";
}; 
mkdir /etc/bind/K49
$TTL     604800          ; Waktu cache default (detik)
@        IN      SOA     localhost. root.localhost. (
                         2025101201 ; Serial (format YYYYMMDDXX)
                         604800     ; Refresh (1 minggu)
                         86400      ; Retry (1 hari)
                         2419200    ; Expire (4 minggu)
                         604800 )   ; Negative Cache TTL
;

@        IN      NS      localhost.
@        IN      A       127.0.0.1

> /etc/bind/zone.template
cp /etc/bind/zone.template /etc/bind/K49/K49.com
$TTL     604800          ; Waktu cache default (detik)
@        IN       SOA     K49.com. root.K49.com. (
                          2025101201 ; Serial (format YYYYMMDDXX)
                          604800     ; Refresh (1 minggu)
                          86400      ; Retry (1 hari)
                          2419200    ; Expire (4 minggu)
                          604800 )   ; Negative Cache TTL
;

@        IN       NS      K49.com.
@        IN       A       10.88.3.3 
> /etc/bind/K49/K49.com

options {
        directory "/var/cache/bind";

        dnssec-validation no;

        forwarders {
                192.168.122.1;
        };

        allow-query{any;};
        auth-nxdomain no;
        listen-on-v6 { any; };
}; > /etc/bind/named.conf.options
service bind9 restart

#Valmar
apt-get install && apt-get update bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9
vim /etc/bind/named.conf.local
zone "K49.com" {
    type slave;
    masters { 10.88.3.3; };
    file "/etc/bind/K49/K49.com";
};
