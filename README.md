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

## Soal 10

Vingilot

<img width="1304" height="1001" alt="image" src="https://github.com/user-attachments/assets/16be753e-8ce7-4779-b5d1-811e102bff6f" />

Cidran

<img width="1499" height="96" alt="image" src="https://github.com/user-attachments/assets/4677c40b-c3b7-4303-b871-8b2fc5a53143" />

## Soal 11

Sirion
<img width="1328" height="1108" alt="image" src="https://github.com/user-attachments/assets/ef57b2f9-bc06-4acc-aefc-5a1e99d80199" />

Earendil
<img width="1440" height="445" alt="Screenshot 2025-10-13 200550" src="https://github.com/user-attachments/assets/c70b644b-18c0-4a4d-b7d0-c053f1164b7c" />

## Soal 12
Sirion
<img width="1093" height="848" alt="image" src="https://github.com/user-attachments/assets/8a9a5a50-4f5c-452a-8727-dd9dba0cd1e2" />

Cidran
<img width="1050" height="380" alt="image" src="https://github.com/user-attachments/assets/24514c3a-5994-4516-90da-d1a0558483e3" />

## Soal 13

## Soal 14

## Soal 15
