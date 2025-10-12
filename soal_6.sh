# Di Tirion
service bind9 restart

# Di Valmar
chown -R bind:bind /etc/bind/K49
chmod 755 /etc/bind/K49

service bind9 restart

nano soal_6.sh
# ini soal_6.sh
#!/bin/bash
# Script verifikasi zone transfer antara ns1 (Tirion) dan ns2 (Valmar)

ZONENAME="jarkomK49.com"
MASTER_IP="10.88.3.3"
SLAVE_IP="10.88.3.4"

echo "=== 🔍 Mengecek zone transfer $ZONENAME ==="
echo

# Cek SOA serial dari ns1
SERIAL_MASTER=$(dig @$MASTER_IP $ZONENAME SOA +short | awk '{print $3}')
# Cek SOA serial dari ns2
SERIAL_SLAVE=$(dig @$SLAVE_IP $ZONENAME SOA +short | awk '{print $3}')

echo "SOA Serial di ns1 (Tirion)  : $SERIAL_MASTER"
echo "SOA Serial di ns2 (Valmar)  : $SERIAL_SLAVE"
echo

if [ "$SERIAL_MASTER" == "$SERIAL_SLAVE" ] && [ -n "$SERIAL_MASTER" ]; then
    echo "✅ Zone transfer BERHASIL — serial sama di master & slave."
else
    echo "❌ Zone transfer BELUM sinkron."
    echo "Mencoba memicu retransfer otomatis..."
    rndc retransfer $ZONENAME
    sleep 3

    SERIAL_SLAVE_NEW=$(dig @$SLAVE_IP $ZONENAME SOA +short | awk '{print $3}')
    if [ "$SERIAL_MASTER" == "$SERIAL_SLAVE_NEW" ]; then
        echo "✅ Setelah retransfer, zona sinkron!"
    else
        echo "⚠️ Zona masih belum sinkron, cek syslog untuk error:"
        echo "   tail -n 10 /var/log/syslog"
    fi
fi

echo
echo "=== Selesai ==="

# di Valmar jalankan
chown -R bind:bind /etc/bind/K49
chmod 755 /etc/bind/K49

service bind9 restart

ls -l /etc/bind/K49/
