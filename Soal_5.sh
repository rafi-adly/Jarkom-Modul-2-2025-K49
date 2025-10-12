rm /etc/bind/K49/K49.com
nano /etc/bind/K49/K49.com
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
Earendil IN       A       10.88.1.2
Elwing   IN       A       10.88.1.3
Cidran   IN       A       10.88.2.2
Elrond   IN       A       10.88.2.3
Maglor   IN       A       10.88.2.4
Sirion   IN       A       10.88.3.2
Lindon   IN       A       10.88.3.5
Vingilot IN       A       10.88.3.6
