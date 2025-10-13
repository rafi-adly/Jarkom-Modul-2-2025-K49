ping 10.88.3.3 -c 3
ping 10.88.3.4 -c 3

cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.3   # ns1.jarkomK49.com
nameserver 10.88.3.4   # ns2.jarkomK49.com
nameserver 192.168.122.1  # fallback Internet
EOF

nano soal_7.sh
chmod +x soal_7.sh
./soal_7.sh # coba jalanin ini di client timur dan barat dan hasilnya harus sama

#isi soal_7.sh
#!/bin/bash

DOMAIN="jarkomK49.com"
HOSTNAMES=(
    "sirion.$DOMAIN"
    "lindon.$DOMAIN"
    "vingilot.$DOMAIN"
    "www.$DOMAIN"
    "static.$DOMAIN"
    "app.$DOMAIN"
)

EXPECTED_IP=(
    "10.88.3.2" # Sirion
    "10.88.3.5" # Lindon
    "10.88.3.6" # Vingilot
    "10.88.3.2" # www -> Sirion
    "10.88.3.5" # static -> Lindon
    "10.88.3.6" # app -> Vingilot
)

echo "=== Verifikasi Peta Kota dan Pelabuhan ($DOMAIN) ==="
echo "Dijalankan dari host: $(hostname)"
echo "----------------------------------------------------"

ALL_PASS=true
FAIL_COUNT=0

for i in "${!HOSTNAMES[@]}"; do
    HOSTNAME=${HOSTNAMES[$i]}
    EXPECTED=${EXPECTED_IP[$i]}
    
    # Resolusi CNAME/A Record
    # Menggunakan +trace untuk memastikan CNAME terekspos dan hasil akhir IP benar
    # Menggunakan +short untuk output ringkas, dan tail -n 1 untuk mengambil baris IP terakhir
    RESULT=$(dig $HOSTNAME +short | tail -n 1)

    if [ "$RESULT" == "$EXPECTED" ]; then
        echo "✅ PASS: $HOSTNAME resolves ke $RESULT (sesuai target: $EXPECTED)"
    else
        echo "❌ FAIL: $HOSTNAME resolves ke $RESULT (TIDAK sesuai target: $EXPECTED)"
        ALL_PASS=false
        FAIL_COUNT=$((FAIL_COUNT + 1))
    fi
done

echo "----------------------------------------------------"
if $ALL_PASS; then
    echo "🎉 SEMUA $i HOSTNAME BERHASIL diresolve dengan KONSISTEN."
else
    echo "⚠️ Verifikasi GAGAL. Terdapat $FAIL_COUNT hostname yang tidak konsisten."
fi
echo "=== Selesai Verifikasi Nomor 7 ==="
