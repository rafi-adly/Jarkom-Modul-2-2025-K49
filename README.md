# Modul 2 Praktikum Jaringan Komputer

| Nama                       | NRP        |
| -------------------------- | ---------- |
| Revalina Erica Permatasari | 5027241007 |
| Muhammad Rafi` Adly        | 5027241082 |

## Soal 1
Dengan topologi sebagai berikut.
<img width="1029" height="956" alt="image" src="https://github.com/user-attachments/assets/be73e970-b89d-4efc-86d5-b781f504435f" />
Setup konfigurasi alamat serta gateway tiap tokoh sebagai berikut.
- Eonwe
  ```
  auto eth0
  iface eth0 inet dhcp

  auto eth1
  iface eth1 inet static
	  address 10.88.1.1
	  netmask 255.255.255.0

  auto eth2
  iface eth2 inet static
	  address 10.88.2.1
	  netmask 255.255.255.0

  auto eth3
  iface eth3 inet static
	  address 10.88.3.1
	  netmask 255.255.255.0
  
  up apt update -y && apt install iptables -y
  up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16
  ```
- Earendil
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.1.2
	  netmask 255.255.255.0
	  gateway 10.88.1.1
  ```
- Elwing
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.1.3
	  netmask 255.255.255.0
	  gateway 10.88.1.1
  ```
- Cidran
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.2.2
	  netmask 255.255.255.0
	  gateway 10.88.2.1
  ```
- Elrond
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.2.3
	  netmask 255.255.255.0
	  gateway 10.88.2.1
  ```
- Maglor
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.2.4
	  netmask 255.255.255.0
	  gateway 10.88.2.1
  ```
- Sirion
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.3.2
	  netmask 255.255.255.0
	  gateway 10.88.3.1
  ```
- Tirion
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.3.3
	  netmask 255.255.255.0
	  gateway 10.88.3.1
  ```
- Valmar
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.3.4
	  netmask 255.255.255.0
	  gateway 10.88.3.1
  ```
- Lindon
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.3.5
	  netmask 255.255.255.0
	  gateway 10.88.3.1
  ```
- Vingilot
  ```
  auto eth0
  iface eth0 inet static
	  address 10.88.3.6
	  netmask 255.255.255.0
	  gateway 10.88.3.1
  ```

## Soal 2
Dengan Eonwe (Router) yang sudah tersambung ke NAT1, maka jalur WAN di Router sudah aktif. 
<img width="720" height="242" alt="image" src="https://github.com/user-attachments/assets/f4e33683-3902-4596-9b59-77d490f66baa" />

Tambahkan 
`up apt update -y && apt install iptables -y
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16`
di konfigurasi Eonwe agar dapat meneruskan trafik ke alamat internal.

## Soal 3
Pertama, tambahkan resolver `up echo nameserver 192.168.122.1 > /etc/resolv.conf` ke setiap host non-router agar dapat tersambung ke internet setiap interface host aktif. Untuk memastikan klien barat dapat berkomunikasi dengan  klien timur melalui Router Eonwe. Berikut komunikasi yang telah tersambung dari klien barat Elwing ke IP 10.88.2.4 (klien timur Maglor).
<img width="616" height="191" alt="image" src="https://github.com/user-attachments/assets/1b1d491b-a74b-4e6d-a5b8-4b0d1c416b01" />

## Soal 4
<img width="964" height="99" alt="image" src="https://github.com/user-attachments/assets/e6736eb3-2c3c-4830-b015-59083b7caeee" />

<img width="992" height="576" alt="image" src="https://github.com/user-attachments/assets/b829fa4e-2831-43c3-87c1-43f188e0df6a" />

<img width="1051" height="615" alt="image" src="https://github.com/user-attachments/assets/37ccac16-3585-48ec-9ceb-2b36814b8c00" />

## Soal 5

<img width="1048" height="203" alt="image" src="https://github.com/user-attachments/assets/9303c2fe-88ce-43d4-a69d-c7c893a80c44" />

<img width="957" height="187" alt="image" src="https://github.com/user-attachments/assets/a3cbcc01-a7e3-4198-a92f-8c625df9f1cd" />

## Soal 6

<img width="885" height="576" alt="image" src="https://github.com/user-attachments/assets/03da962c-7a9d-47f4-8470-00812d139096" />

## Soal 7

<img width="1036" height="330" alt="image" src="https://github.com/user-attachments/assets/81a85d17-06a2-46cc-b906-11ddc904d411" />

<img width="1006" height="589" alt="image" src="https://github.com/user-attachments/assets/41bda45d-4842-4f62-9105-f1bc1e530df7" />

## Soal 8

Tirion

<img width="944" height="731" alt="image" src="https://github.com/user-attachments/assets/8e74e0fa-a6cb-4ac7-bb4d-ff96532adc76" />

Valmar

<img width="825" height="318" alt="image" src="https://github.com/user-attachments/assets/ae1241dc-2dee-4c77-ac69-9058e7bd1b13" />

Earendil

<img width="832" height="146" alt="image" src="https://github.com/user-attachments/assets/111a13aa-eed8-4a7d-bd17-0657ba18abd6" />

## Soal 9

Lindon

<img width="1001" height="686" alt="image" src="https://github.com/user-attachments/assets/ade9e844-6fa2-4854-90a6-a7105c337d1d" />

Earendil (Timur)

<img width="1104" height="211" alt="image" src="https://github.com/user-attachments/assets/2a96ddc9-e114-43fc-a96f-a8a3797c878c" />

Cidran (Barat)

<img width="1201" height="209" alt="image" src="https://github.com/user-attachments/assets/b96c485b-1690-461d-bbbc-092cc76e353e" />


- **Lindon**
  ```bash
  # Update dan install Nginx
  apt update
  apt install nginx -y

  # Konfigurasi DNS resolver
  cat > /etc/resolv.conf <<EOF
  nameserver 10.88.3.3   
  nameserver 10.88.3.4 
  nameserver 192.168.122.1 
  EOF

  # Buat folder arsip dan file dummy
  mkdir -p /var/www/html/annals/
  echo "Konten Arsip 1" > /var/www/html/annals/arsip_1.txt
  echo "Konten Arsip 2" > /var/www/html/annals/arsip_2.txt

  # Konfigurasi Nginx untuk static.jarkomK49.com dengan autoindex
  cat > /etc/nginx/sites-available/static.conf <<'EOF'
  server {
      listen 80;
      server_name static.jarkomK49.com;
      root /var/www/html;
      index index.html;

      location / {
          try_files $uri $uri/ =404;
      }

      # Konfigurasi khusus untuk folder /annals/
      location /annals/ {
          autoindex on; # Mengaktifkan directory listing
      }
  }
  EOF

  # Aktifkan konfigurasi baru
  ln -s /etc/nginx/sites-available/static.conf /etc/nginx/sites-enabled/
  rm /etc/nginx/sites-enabled/default

  # Restart service Nginx agar konfigurasi diterapkan
  service nginx restart
  ```

  **Penjelasan:**
  - Menginstal **Nginx** sebagai web server.
  - Mengatur **DNS resolver** agar server bisa melakukan resolusi domain.
  - Membuat direktori `/annals/` dan dua file dummy untuk pengujian.
  - Membuat konfigurasi virtual host `static.jarkomK49.com`:
    - Melayani permintaan HTTP di port 80.
    - Root dokumen di `/var/www/html`.
    - Folder `/annals/` memiliki fitur **autoindex** (menampilkan daftar file otomatis).
  - Mengaktifkan konfigurasi baru dengan symbolic link dan menghapus default config.
  - Merestart Nginx untuk menerapkan perubahan.

---

- **Client Timur / Barat**
  ```bash
  # Uji akses ke server Lindon
  curl http://static.jarkomK49.com/annals/
  ```

  **Penjelasan:**
  - Menggunakan `curl` untuk mengakses folder `/annals/` pada domain `static.jarkomK49.com`.
  - Jika berhasil, akan muncul daftar file seperti:
    ```
    arsip_1.txt
    arsip_2.txt
    ```
  - Ini menandakan konfigurasi Nginx dan fitur **autoindex** berfungsi dengan benar.

---

### ✅ **Kesimpulan**
Server **Lindon** berhasil dikonfigurasi sebagai **web server Nginx** untuk domain  
`static.jarkomK49.com` dengan folder `/annals/` yang menampilkan isi file secara otomatis.

## Soal 10

Vingilot

<img width="1304" height="1001" alt="image" src="https://github.com/user-attachments/assets/16be753e-8ce7-4779-b5d1-811e102bff6f" />

Cidran

<img width="1499" height="96" alt="image" src="https://github.com/user-attachments/assets/4677c40b-c3b7-4303-b871-8b2fc5a53143" />


## Setup Konfigurasi Web Server **Vingilot**

- **Vingilot**
  ```bash
  # Update sistem dan install Nginx serta PHP-FPM
  apt update
  apt install nginx php8.4-fpm -y

  # Membuat direktori web untuk domain app.jarkomK49.com
  mkdir -p /var/www/html/app.jarkomK49.com/

  # File index.php (halaman beranda)
  cat > /var/www/html/app.jarkomK49.com/index.php <<'EOF'
  <?php 
      echo "<h1>Vingilot <3</h1>";
      echo "<p>Kapal web dinamis.</p>";
      echo "<ul>";
      echo "<li><a href='/about'>Pergi ke Halaman About (Menguji Rewrite)</a></li>";
      echo "</ul>";
  ?>
  EOF

  # File about.php (halaman tentang)
  cat > /var/www/html/app.jarkomK49.com/about.php <<'EOF'
  <?php 
      echo "<h1>Tentang Vingilot</h1>";
      echo "<p>Vingilot123 test test.</p>";
      echo "<a href='/'>Kembali ke Beranda</a>"; 
  ?>
  EOF

  # Konfigurasi Nginx untuk app.jarkomK49.com
  cat > /etc/nginx/sites-available/app.conf <<'EOF'
  server {
      listen 80;
      server_name app.jarkomK49.com;
      root /var/www/html/app.jarkomK49.com;
      index index.php index.html;

      # Konfigurasi PHP-FPM
      location ~ \.php$ {
          include snippets/fastcgi-php.conf;
          fastcgi_pass unix:/var/run/php/php8.4-fpm.sock; # Sesuaikan socket jika perlu
      }

      # Terapkan rewrite untuk /about (menghapus .php)
      location / {
          try_files $uri $uri/ $uri.php?$args;
      }
  }
  EOF

  # Aktifkan konfigurasi dan hapus default site
  ln -sf /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/
  rm -f /etc/nginx/sites-enabled/default

  # Restart Nginx dan PHP-FPM agar konfigurasi diterapkan
  service php8.4-fpm restart
  service nginx restart
  ```

  **Penjelasan:**
  - Menginstal **Nginx** dan **PHP-FPM 8.4** agar bisa menjalankan halaman PHP.
  - Membuat struktur web di `/var/www/html/app.jarkomK49.com/`.
  - File `index.php` → halaman utama (beranda).
  - File `about.php` → halaman tentang yang akan diuji dengan rewrite URL.
  - Konfigurasi Nginx:
    - Mendengarkan port `80`.
    - Menentukan root direktori untuk domain.
    - Mengaktifkan pemrosesan file PHP via `php8.4-fpm` socket.
    - Menggunakan `try_files` agar `/about` otomatis diarahkan ke `about.php`.

---

- **Client (Uji Akses)**
  ```bash
  # Uji akses ke beranda
  curl http://app.jarkomK49.com

  # Uji akses ke halaman About (tanpa .php)
  curl http://app.jarkomK49.com/about
  ```

  **Penjelasan:**
  - `curl http://app.jarkomK49.com` → menampilkan halaman beranda “Vingilot <3”.
  - `curl http://app.jarkomK49.com/about` → menampilkan halaman “Tentang Vingilot”.
  - Rewrite URL berfungsi jika halaman `/about` tampil **tanpa perlu mengetik `.php`**.

---

### **Kesimpulan**
Server **Vingilot** berhasil dikonfigurasi sebagai **web server dinamis** untuk domain  
`app.jarkomK49.com`, dengan dukungan **PHP-FPM** dan **rewrite URL** untuk routing halaman yang lebih bersih.

## Soal 11

Sirion
<img width="1328" height="1108" alt="image" src="https://github.com/user-attachments/assets/ef57b2f9-bc06-4acc-aefc-5a1e99d80199" />

Earendil
<img width="1440" height="445" alt="Screenshot 2025-10-13 200550" src="https://github.com/user-attachments/assets/c70b644b-18c0-4a4d-b7d0-c053f1164b7c" />

Server **Sirion** berfungsi sebagai **reverse proxy** dan **redirector domain** untuk jaringan `jarkomK49.com`.  
Server ini meneruskan request ke dua server lain:
- `/static/` → diarahkan ke **Lindon (10.88.3.5)**
- `/app/` → diarahkan ke **Vingilot (10.88.3.6)**

Selain itu, `sirion.jarkomK49.com` akan **redirect otomatis** ke hostname kanonik `www.jarkomK49.com`.

---

## Setup Konfigurasi Web Server **Sirion**

- **Sirion**
  ```bash
  # Update sistem, install Nginx dan Apache utilities
  apt update && apt install nginx -y && apt install apache2-utils -y

  # Konfigurasi DNS resolver
  cat > /etc/resolv.conf <<EOF_RESOLVER
  nameserver 10.88.3.3
  nameserver 10.88.3.4
  nameserver 192.168.122.1
  search jarkomK49.com
  EOF_RESOLVER

  # Konfigurasi Nginx sebagai reverse proxy
  cat > /etc/nginx/sites-available/reverse_proxy.conf <<'EOF'

  # BLOK 1: Redirect dari hostname non-kanonik (sirion.jarkomK49.com)
  server {
      listen 80;
      server_name sirion.jarkomK49.com;
      
      # Redirect permanen (301) ke domain utama www.jarkomK49.com
      return 301 http://www.jarkomK49.com$request_uri;
  }

  # BLOK 2: Hostname kanonik dan reverse proxy utama
  server {
      listen 80;
      server_name www.jarkomK49.com;
      
      # Routing ke server Lindon untuk konten statis
      location /static/ {
          proxy_pass http://10.88.3.5/;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_redirect off;
      }

      # Routing ke server Vingilot untuk aplikasi dinamis
      location /app/ {
          proxy_pass http://10.88.3.6/;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_redirect off;
      }
      
      # Default handler untuk endpoint yang tidak dikenal
      location / {
          return 404 "Sirion: Endpoint tidak ditemukan. Coba /static/ atau /app/.";
      }
  }
  EOF

  # Aktifkan konfigurasi reverse proxy dan hapus default site
  ln -sf /etc/nginx/sites-available/reverse_proxy.conf /etc/nginx/sites-enabled/
  rm -f /etc/nginx/sites-enabled/default 

  # Uji konfigurasi dan restart Nginx
  nginx -t
  service nginx restart
  ```

  **Penjelasan:**
  - `apache2-utils` diinstal untuk menyediakan utilitas tambahan seperti `htpasswd` (jika nanti dibutuhkan untuk autentikasi).
  - Blok server pertama (`sirion.jarkomK49.com`) berfungsi untuk **redirect permanen (301)** ke domain utama `www.jarkomK49.com`.
  - Blok kedua (`www.jarkomK49.com`) melakukan fungsi **reverse proxy**:
    - `/static/` → meneruskan ke **Lindon (10.88.3.5)**, tempat file statis disajikan.
    - `/app/` → meneruskan ke **Vingilot (10.88.3.6)**, tempat aplikasi PHP berjalan.
  - Jika pengguna mengakses path lain di luar `/static/` dan `/app/`, maka akan muncul **pesan 404 kustom**.

---

- **Client (Uji Akses)**
  ```bash
  # Cek redirect dari sirion.jarkomK49.com ke www.jarkomK49.com
  curl -I http://sirion.jarkomK49.com

  # Akses konten statis dari Lindon melalui Sirion
  curl http://www.jarkomK49.com/static/annals/

  # Akses aplikasi dinamis dari Vingilot melalui Sirion
  curl http://www.jarkomK49.com/app/about
  ```

  **Penjelasan:**
  - `curl -I` → hanya menampilkan header untuk memastikan **redirect 301** berjalan.
  - `curl http://www.jarkomK49.com/static/annals/` → menampilkan daftar file dari **Lindon**.
  - `curl http://www.jarkomK49.com/app/about` → menampilkan halaman “Tentang Vingilot” dari **Vingilot**.
  - Semua permintaan difilter dan diarahkan sesuai path oleh **Sirion**.

---

### **Kesimpulan**
Server **Sirion** berfungsi sebagai **reverse proxy gateway** untuk domain `www.jarkomK49.com`,  
menghubungkan pengguna ke dua backend server:
- **Lindon** → konten statis (`/static/`)
- **Vingilot** → aplikasi dinamis (`/app/`)

Serta melakukan redirect otomatis dari `sirion.jarkomK49.com` ke `www.jarkomK49.com`.

## Soal 12
Sirion
<img width="1093" height="848" alt="image" src="https://github.com/user-attachments/assets/8a9a5a50-4f5c-452a-8727-dd9dba0cd1e2" />

Cidran
<img width="1050" height="380" alt="image" src="https://github.com/user-attachments/assets/24514c3a-5994-4516-90da-d1a0558483e3" />

### 1. Update dan Instalasi Paket
```bash
apt update && apt install apache2-utils -y
```
- `apt update` memperbarui daftar paket di sistem.
- `apt install apache2-utils -y` menginstal utilitas tambahan untuk Apache, termasuk perintah `htpasswd` yang digunakan untuk membuat file autentikasi HTTP Basic.

---

### 2. Membuat File Autentikasi
```bash
htpasswd -c /etc/nginx/htpasswd.sirion admin
```
- `htpasswd` digunakan untuk membuat file yang berisi username dan password terenkripsi.
- Opsi `-c` membuat file baru `/etc/nginx/htpasswd.sirion`.
- Username `admin` akan dibuat, dan kamu akan diminta memasukkan password **sirionpass**.

> **Catatan:** Saat diminta password, masukkan `sirionpass`.

---

### 3. Mengedit Konfigurasi Nginx
```bash
nano /etc/nginx/sites-available/reverse_proxy.conf
```
Tambahkan blok konfigurasi berikut di dalam file setelah `location /app`:

```nginx
location /admin/ {
    auth_basic "Sirion Admin Area";
    auth_basic_user_file /etc/nginx/htpasswd.sirion;
    
    proxy_pass http://10.88.3.6/admin/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_redirect off;
}
```
#### Penjelasan:
- `auth_basic "Sirion Admin Area";` → Menampilkan pesan autentikasi saat login.
- `auth_basic_user_file` → Menunjuk ke file kredensial yang telah dibuat.
- `proxy_pass` → Meneruskan permintaan ke server tujuan (`10.88.3.6`).
- `proxy_set_header` → Mengatur header untuk mempertahankan informasi IP asli pengguna.
- `proxy_redirect off;` → Mencegah pengalihan otomatis.

---

### 4. Mengatur Izin Akses File
```bash
chmod 644 /etc/nginx/htpasswd.sirion
chown www-data:www-data /etc/nginx/htpasswd.sirion
```
- `chmod 644` → Memberikan izin baca untuk semua user, tulis hanya untuk pemilik.
- `chown www-data:www-data` → Mengubah kepemilikan file agar sesuai dengan user dan grup Nginx.

---

### 5. Mengecek dan Menjalankan Nginx
```bash
nginx -t
service nginx stop
service nginx start
```
- `nginx -t` → Memeriksa apakah konfigurasi Nginx valid.
- `service nginx stop/start` → Menghentikan dan memulai ulang layanan Nginx.

---

### 6. Mengecek Port 80
```bash
netstat -tuln | grep 80
```
- Mengecek apakah Nginx aktif dan mendengarkan di port 80 (HTTP).

---

### 7. Pengujian di Client (Cirdan/Erlond)
#### Tes tanpa autentikasi:
```bash
curl -I http://www.jarkomK49.com/admin/
```
Output yang diharapkan:
```
HTTP/1.1 401 Authorization Required
```
Artinya, area `/admin` dilindungi oleh autentikasi.

### Tes dengan autentikasi:
```bash
curl -u admin:sirionpass http://www.jarkomK49.com/admin/
```
Output bisa berupa:
```
HTTP/1.1 404 Not Found
```
(jika path `/admin` belum ada di server backend) atau
```
HTTP/1.1 200 OK
```
(jika halaman admin tersedia).

---

### Kesimpulan
Konfigurasi ini menambahkan **proteksi Basic Auth** untuk path `/admin` di Nginx reverse proxy yang meneruskan trafik ke server backend `10.88.3.6`.  
Hanya user dengan kredensial valid (`admin:sirionpass`) yang dapat mengakses halaman admin.

## Soal 13
Sirion
<img width="1894" height="200" alt="image" src="https://github.com/user-attachments/assets/28e1b7cd-2d1f-4689-a654-16ae1e7dfd6b" />

Elrond (Client)
<img width="865" height="588" alt="image" src="https://github.com/user-attachments/assets/3efe5ff4-eb30-4e15-8919-b174a8e4384f" />

### 1. Menambahkan Redirect untuk IP 10.88.3.2
```bash
echo "--- 1. Tambah Redirect IP 10.88.3.2 ---"
```
Baris ini hanya menampilkan pesan ke terminal untuk menandakan langkah yang sedang dijalankan.

---

### 2. Menyisipkan Server Block Baru
```bash
sed -i '1s/^/server {\n    listen 80;\n    server_name 10.88.3.2; \n\n    return 301 http:\/\/www.jarkomK49.com\$request_uri;\n}\n\n/' /etc/nginx/sites-available/reverse_proxy.conf
```
#### Penjelasan:
- **`sed -i`** → Mengedit file secara langsung (in-place).
- **`'1s/^/.../'`** → Artinya: pada baris pertama (`1`), ganti awal baris (`^`) dengan teks yang ditentukan.
- **Isi yang disisipkan:**
  ```nginx
  server {
      listen 80;
      server_name 10.88.3.2;

      return 301 http://www.jarkomK49.com$request_uri;
  }
  ```
#### Fungsi Blok Server Ini:
- `listen 80;` → Menerima koneksi di port 80 (HTTP).
- `server_name 10.88.3.2;` → Server ini akan menangani permintaan ke IP 10.88.3.2.
- `return 301 http://www.jarkomK49.com$request_uri;` →
  Melakukan **redirect permanen (HTTP 301)** dari `10.88.3.2` menuju domain `www.jarkomK49.com` sambil mempertahankan path yang diminta (`$request_uri`).

Jadi, jika pengguna membuka `http://10.88.3.2/app`, akan diarahkan otomatis ke `http://www.jarkomK49.com/app`.

---

### 3. Mengecek Konfigurasi dan Restart Nginx
```bash
nginx -t
service nginx restart
```
- **`nginx -t`** → Memeriksa apakah konfigurasi Nginx valid dan tidak ada error sintaks.
- **`service nginx restart`** → Memuat ulang Nginx agar perubahan konfigurasi segera diterapkan.

---

### Kesimpulan
Perintah ini menambahkan konfigurasi otomatis di bagian atas file `/etc/nginx/sites-available/reverse_proxy.conf` agar setiap akses ke **IP 10.88.3.2** otomatis **di-redirect permanen (HTTP 301)** ke domain **www.jarkomK49.com**, dengan path yang sama seperti permintaan aslinya.

## Soal 14

Vingilot
<img width="1171" height="471" alt="image" src="https://github.com/user-attachments/assets/7049bcca-9a15-42c9-b541-c26c9dfccead" />

Elrond
<img width="1669" height="151" alt="image" src="https://github.com/user-attachments/assets/07239a9c-515e-417e-a761-50b5ae147f2e" />

### 1. Membuka File Konfigurasi
```bash
nano /etc/nginx/sites-available/app.conf
```
Perintah ini membuka file konfigurasi Nginx bernama `app.conf` di editor **nano**.  
File ini biasanya berisi pengaturan server block untuk aplikasi `/app`.

---

### 2. Menambahkan Baris Log Akses
Tambahkan baris berikut di dalam blok `server { ... }`:
```nginx
access_log /var/log/nginx/access.log main;
```
#### Penjelasan:
- `access_log` → Menentukan lokasi file log untuk menyimpan semua request yang diterima oleh Nginx.
- `/var/log/nginx/access.log` → Lokasi file log utama di sistem.
- `main` → Format log bawaan (default log format) yang sudah didefinisikan di file konfigurasi utama `/etc/nginx/nginx.conf`.

Dengan konfigurasi ini, setiap request HTTP ke server akan dicatat di file `/var/log/nginx/access.log`.

---

### 3. Mengecek dan Menjalankan Nginx
```bash
nginx -t
sever nginx stop
server nginx start
```
#### Penjelasan:
- `nginx -t` → Mengecek apakah file konfigurasi valid.
- `service nginx stop` → Menghentikan layanan Nginx (ada typo di contoh: harusnya **service**, bukan **sever**).
- `service nginx start` → Menyalakan kembali layanan Nginx agar konfigurasi baru diterapkan.

> **Catatan:**  
> Koreksi perintah yang benar:
> ```bash
> service nginx stop
> service nginx start
> ```

---

### 4. Melihat Isi Log Akses
```bash
tail /var/log/nginx/access.log
```
- `tail` menampilkan beberapa baris terakhir dari file log.
- Gunakan ini untuk memantau apakah request dari client benar-benar tercatat di log.

Contoh output:
```
192.168.1.10 - - [22/Oct/2025:17:42:01 +0700] "GET /app/ HTTP/1.1" 200 532 "-" "curl/7.68.0"
```
Artinya, client dengan IP `192.168.1.10` melakukan request ke `/app/` dengan status **200 OK**.

---

### 5. Pengujian dari Client
```bash
curl http://www.jarkomK49.com/app/
```
#### Penjelasan:
- `curl` digunakan untuk mengirim request HTTP ke server.
- Jika konfigurasi benar, akan muncul **response 200 OK** dari server, dan request tersebut akan muncul di log Nginx.

---

### Kesimpulan
Konfigurasi ini menambahkan **pencatatan log akses (access log)** untuk semua request ke aplikasi `/app`.  
Hasil log disimpan di `/var/log/nginx/access.log`, yang dapat dipantau dengan perintah `tail`.  
Langkah ini penting untuk memonitor trafik, debugging, dan analisis aktivitas pengguna.

## Soal 15

<img width="1007" height="1133" alt="image" src="https://github.com/user-attachments/assets/91f120cf-8815-45f5-81f5-a1dd971a3687" />

<img width="1119" height="1213" alt="image" src="https://github.com/user-attachments/assets/58db2720-6ba3-4dea-ada1-102f040548a2" />

### 🌐 Konfigurasi & Pengujian Load Balancer (Nginx)
### Server: Vingilot (menangani /app/)

### 1️⃣ Update package list dan install apache2-utils untuk benchmark (ab)
apt update && apt install apache2-utils -y

### 2️⃣ Buka konfigurasi virtual host Nginx untuk aplikasi
nano /etc/nginx/sites-available/app.conf

### 3️⃣ Tambahkan baris ini di dalam blok `server { ... }` untuk mencatat akses log
``` access_log /var/log/nginx/access.log main;```

### 4️⃣ Uji apakah konfigurasi Nginx valid
nginx -t

### 5️⃣ Restart Nginx agar perubahan diterapkan
### Gunakan perintah yang benar (bukan 'sever')
```
systemctl stop nginx
systemctl start nginx
```
### 6️⃣ Pastikan log akses sudah aktif
```tail /var/log/nginx/access.log```

### 🧪 Pengujian Load Balancing
Kita menggunakan 'ab' (Apache Benchmark) untuk menguji performa endpoint.
-n 500 → total 500 request
-c 10  → 10 concurrent users (10 pengguna bersamaan)

🔹 Uji endpoint /app/ di server Vingilot
echo "=== HASIL UJI /app/ (Vingilot) ==="
ab -n 500 -c 10 http://www.jarkomK49.com/app/

🔹 Uji endpoint /static/ di server Lindon
echo "=== HASIL UJI /static/ (Lindon) ==="
ab -n 500 -c 10 http://www.jarkomK49.com/static/


### 📄 Penjelasan 
### 1. access_log
    → Menyimpan catatan semua request yang masuk ke Nginx.
      Format default 'main' berisi IP, waktu, URL, dan kode status.

### 2. nginx -t
    → Mengecek apakah konfigurasi Nginx valid sebelum di-restart.

### 3. systemctl stop/start nginx
    → Me-restart Nginx agar konfigurasi baru diterapkan.

### 4. tail /var/log/nginx/access.log
    → Melihat log akses secara langsung untuk memastikan request tercatat.

### 5. ab (Apache Benchmark)
    → Alat pengujian performa untuk mengukur kecepatan respon server.
      Hasil utama yang perlu diperhatikan:
         - Requests per second (lebih tinggi lebih baik)
         - Time per request (lebih rendah lebih baik)
         - Failed requests (sebaiknya 0)

### 6. Hasil uji bisa dibandingkan antara /app/ dan /static/
    untuk melihat distribusi beban (load balancing) dan performa antar server.
