# Jarkom-Modul-3-B25-2023


## Nama Anggota :
| No | Nama| NRP|
| ------- | ------- | ------- |
| 1 | Muhamad Faiz Fernanda | 5025211186|
| 2| Tigo S Yoga | 5025211125 |

## Daftar Soal
- [Config](#Config) <br/>
- [Soal 1](#Nomer-1) <br/>
- [Soal 2](#Nomer-2) <br/>
- [Soal 3](#Nomer-3) <br/>
- [Soal 4](#Nomer-4) <br/>
- [Soal 5](#Nomer-5) <br/>
- [Soal 6](#Nomer-6) <br/>
- [Soal 7](#Nomer-7) <br/>
- [Soal 8](#Nomer-8) <br/>
- [Soal 9](#Nomer-9) <br/>
- [Soal 10](#Nomer-10) <br/>
- [Soal 11](#Nomer-11) <br/>
- [Soal 12](#Nomer-12) <br/>
- [Soal 13](#Nomer-13) <br/>
- [Soal 14](#Nomer-14) <br/>
- [Soal 15](#Nomer-15) <br/>
- [Soal 16](#Nomer-16) <br/>
- [Soal 17](#Nomer-17) <br/>
- [Soal 18](#Nomer-18) <br/>
- [Soal 19](#Nomer-19) <br/>
- [Soal 20](#Nomer-20) <br/>

### Config
- Aura (DHCP Relay)
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.21.1.0
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.21.2.0
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 10.21.3.0
        netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 10.21.4.0
        netmask 255.255.255.0
```

- Himmel (DHCP Server)
```
auto eth0
iface eth0 inet static
	address 10.21.1.1
	netmask 255.255.255.0
	gateway 10.21.1.0
```

- Helter (DNS Server)
```
auto eth0
iface eth0 inet static
	address 10.21.1.2
	netmask 255.255.255.0
	gateway 10.21.1.0
```

- Denken (Database Server)
```
auto eth0
iface eth0 inet dhcp
hwaddress ether 76:b9:f0:24:43:e3
```

- Elsen (Load Balancer)
```
auto eth0
iface eth0 inet dhcp
hwaddress ether f2:a7:a2:ef:b1:f0
```

- Lawine (PHP Worker)
```
auto eth0
iface eth0 inet dhcp
hwaddress ether ce:4f:fa:0a:55:1b
```

- Linie (PHP Worker)
```
auto eth0
iface eth0 inet dhcp
hwaddress ether b6:49:b2:00:58:cf
```

- Lugner (PHP Worker)
```
auto eth0
iface eth0 inet dhcp
hwaddress ether 7a:f7:4c:c5:31:02
```

- Frieren (Laravel Worker)
```
auto eth0
iface eth0 inet dhcp
hwaddress ether 0a:9d:17:b8:c4:08
```

- Flamme (Laravel Worker)
```
auto eth0
iface eth0 inet dhcp
hwaddress ether 2a:77:88:92:03:4b
```

- Fern (Laravel Worker)
```
auto eth0
iface eth0 inet dhcp
hwaddress ether f2:a0:58:fe:fd:00
```

- Stark, Sein, Revolt, Richter (Client)
```
auto eth0
iface eth0 inet dhcp
```


### Nomer-11
### Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id. (11) hint: (proxy_pass)

- lalu melakukan setting pada **/etc/nginx sites-available/lb-jarkom-php**
```
 location /its {
            proxy_pass https://www.its.ac.id/;
           
        }
```
#### untuk full scriptnya 
```
echo '
#Default menggunakan Round Robin
upstream backend  {
    server 10.21.3.1; #IP Lawine
    server 10.21.3.2; #IP Linie
    server 10.21.3.3; #IP Lugnar
}

server {

listen 80;

server_name granz.channel.B25.com;

        location / {
            #no 12
            allow 10.21.3.69;
            allow 10.21.s3.70;
            allow 10.21.4.167;
            allow 10.21.4.168;
            deny all;
            proxy_pass http://backend;
            proxy_set_header    X-Real-IP $remote_addr;
            proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header    Host $http_host;

            auth_basic "Administrator'\''s Area";
            auth_basic_user_file /etc/nginx/.htpasswd;
        }
        #no 11
         location /its {
            proxy_pass https://www.its.ac.id/;
           
        }

        location ~ /\.ht {
            deny all;
        }

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}' > /etc/nginx/sites-available/lb-jarkom-php

```
- lalu kita melakukan testing dengan mengandung **/its**
```
lynx granz.channel.B25.com/its
```
#### Hasil
![Screenshot 2023-11-19 203437](https://github.com/tigoyoga/Jarkom-Modul-3-B25-2023/assets/101172294/e2226455-8674-4c9d-b7a7-d0916ed1eb72)


### Nomer-12
### Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].3.69, [Prefix IP].3.70, [Prefix IP].4.167, dan [Prefix IP].4.168. (12) hint: (fixed in dulu clinetnya)

- lalu melakukan setting pada **/etc/nginx sites-available/lb-jarkom-php**
```
 location / {
            #no 12
            allow 10.21.3.69;
            allow 10.21.s3.70;
            allow 10.21.4.167;
            allow 10.21.4.168;
            deny all;
            proxy_pass http://backend;
            proxy_set_header    X-Real-IP $remote_addr;
            proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header    Host $http_host;

            auth_basic "Administrator'\''s Area";
            auth_basic_user_file /etc/nginx/.htpasswd;
        }
```
Berikut ini untuk full scriptnya 
```
echo '
#Default menggunakan Round Robin
upstream backend  {
    server 10.21.3.1; #IP Lawine
    server 10.21.3.2; #IP Linie
    server 10.21.3.3; #IP Lugnar
}

server {

listen 80;

server_name granz.channel.B25.com;

        location / {
            #no 12
            allow 10.21.3.69;
            allow 10.21.s3.70;
            allow 10.21.4.167;
            allow 10.21.4.168;
            deny all;
            proxy_pass http://backend;
            proxy_set_header    X-Real-IP $remote_addr;
            proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header    Host $http_host;

            auth_basic "Administrator'\''s Area";
            auth_basic_user_file /etc/nginx/.htpasswd;
        }
        #no 11
         location /its {
            proxy_pass https://www.its.ac.id/;
           
        }

        location ~ /\.ht {
            deny all;
        }

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}' > /etc/nginx/sites-available/lb-jarkom-php

```
- disini kita melakukan pengkondisian dimana **IP** yang di izinkan mengakses hanya **ip** tertentu sesuai dengan keinginan soal. Untuk melakukan Testing bisa menggunakan **IP** yang tertera atau menambahkan **IP** yang client yang ingin kita gunakan untuk testing
![2](https://github.com/tigoyoga/Jarkom-Modul-3-B25-2023/assets/101172294/280f2827-0b04-4b7e-b47a-c30c4099d9e5)
![12 2](https://github.com/tigoyoga/Jarkom-Modul-3-B25-2023/assets/101172294/1b702264-3cc8-4010-ab4c-c8a79a2507d6)

### Nomer-13
### Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern.
- Pertama melakukan set up pada node **Denken** dimana sebagai **Database server** ,berikut ini scriptnya 
```
echo '
[client-server]

# Import all .cnf files from configuration directory
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

[mysqld]
skip-networking=0
skip-bind-address ' >/etc/mysql/my.cnf
```

- setelah itu jalan perintah berikut ini,dimana untuk membuat database yang akan di akses oleh client
```
mysql -u root -p

CREATE USER 'kelompokb25'@'%' IDENTIFIED BY
'passwordb25';
CREATE USER 'kelompokb25'@'localhost' IDENTIFIED
BY 'passwordb25';
CREATE DATABASE dbkelompokb25;
GRANT ALL PRIVILEGES ON *.* TO 'kelompokb25'@'%';
GRANT ALL PRIVILEGES ON *.* TO
'kelompokb25'@'localhost';
FLUSH PRIVILEGES;

```
![13 1](https://github.com/tigoyoga/Jarkom-Modul-3-B25-2023/assets/101172294/262f8292-11ad-4905-8934-52be00393421)

### Result 
setelah itu melakukan pengecekan pada laravel worker. bisa di pakai salah satu worker aja (Frieren)
```
mariadb --host=10.21.2.1 --port=3306 --user=kelompokb25 --password=passwordb25 dbkelompokb25 -e "SHOW DATABASES;"

``
![frieren 13 2](https://github.com/tigoyoga/Jarkom-Modul-3-B25-2023/assets/101172294/01cbe59d-9fd8-466c-9c01-0232c8311461)

