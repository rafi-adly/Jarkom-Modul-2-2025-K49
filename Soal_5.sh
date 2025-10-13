# Set hostname setiap host
hostname earendil
hostname elwing
hostname cirdan
hostname elrond
hostname maglor
hostname sirion
hostname lindon
hostname vingilot

# Update /etc/hosts di setiap hosts
cat > /etc/hosts <<EOF
127.0.0.1       localhost
10.88.3.3       ns1.jarkomK49.com     ns1
10.88.3.4       ns2.jarkomK49.com     ns2
10.88.3.2       sirion.jarkomK49.com  sirion
10.88.3.5       lindon.jarkomK49.com  lindon
10.88.3.6       vingilot.jarkomK49.com vingilot
10.88.1.2       earendil.jarkomK49.com earendil
10.88.1.3       elwing.jarkomK49.com   elwing
10.88.2.2       cirdan.jarkomK49.com   cirdan
10.88.2.3       elrond.jarkomK49.com   elrond
10.88.2.4       maglor.jarkomK49.com   maglor
EOF

# Update resolver 
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.3   # ns1.jarkomK49.com
nameserver 10.88.3.4   # ns2.jarkomK49.com
nameserver 192.168.122.1  # fallback Internet
EOF

# ke host non router
cat > /etc/resolv.conf << EOF
nameserver 10.88.3.3
nameserver 10.88.3.4
nameserver 192.168.122.1
search jarkomK49.com
EOF

# Verif DNS internal
# Cek apex domain
dig @10.88.3.3 jarkomK49.com
dig @10.88.3.4 jarkomK49.com

# Cek hostname layanan
dig @10.88.3.3 www.jarkomK49.com
dig @10.88.3.4 www.jarkomK49.com

# Cek bisa ping via hostname
ping -c 3 sirion.jarkomK49.com 
ping -c 3 lindon.jarkomK49.com 
ping -c 3 vingilot.jarkomK49.com
ping -c 3 earendil.jarkomK49.com
ping -c 3 elwing.jarkomK49.com 
ping -c 3 cirdan.jarkomK49.com   
ping -c 3 elrond.jarkomK49.com 
ping -c 3 maglor.jarkomK49.com 
