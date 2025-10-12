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



