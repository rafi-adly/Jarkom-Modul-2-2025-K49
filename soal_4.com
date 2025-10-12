#Tirion
apt-get update -y
apt-get install bind9 -y

cat > /etc/bind/named.conf.local <<EOF
zone "K49.com" {
    type master;
    notify yes;
    also-notify { 10.88.3.4; };
    allow-transfer { 10.88.3.4; };
    file "/etc/bind/K49/K49.com";
};
EOF

mkdir -p /etc/bind/K49
cat > /etc/bind/K49/K49.com <<EOF
$TTL 604800
@       IN SOA ns1.K49.com. root.K49.com. (
                            2025101202
                			604800
                			86400
                			2419200
                			604800 )
@       	IN 		NS 	ns1.K49.com.
@       	IN 		NS 	ns2.K49.com.
@       	IN 		A 	10.88.3.2
ns1     	IN 		A 	10.88.3.3
ns2     	IN 		A 	10.88.3.4
Earendil 	IN 		A 	10.88.1.2
Elwing   	IN 		A 	10.88.1.3
Cidran   	IN 		A 	10.88.2.2
Elrond   	IN 		A 	10.88.2.3
Maglor   	IN 		A	10.88.2.4
Sirion   	IN 		A 	10.88.3.2
Lindon   	IN 		A 	10.88.3.5
Vingilot 	IN 		A 	10.88.3.6
www      	IN 	CNAME Sirion.K49.com.
static   	IN 	CNAME Lindon.K49.com.
app      	IN 	CNAME Vingilot.K49.com.
EOF

cat > /etc/bind/named.conf.options <<EOF
options {
    directory "/var/cache/bind";
    dnssec-validation no;
    forwarders {
        192.168.122.1;
    };
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};
EOF

service bind9 restart


#Valmar
apt-get update -y
apt-get install bind9 -y

mkdir -p /etc/bind/K49
cat > /etc/bind/named.conf.local <<EOF
zone "K49.com" {
    type slave;
    masters { 10.88.3.3; };
    file "/etc/bind/K49/K49.com";
};
EOF

service bind9 restart
