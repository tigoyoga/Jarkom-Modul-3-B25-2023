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

### Nomer 0
Setelah mengalahkan Demon King, perjalanan berlanjut. Kali ini, kalian diminta untuk melakukan register domain berupa riegel.canyon.yyy.com untuk worker Laravel dan granz.channel.yyy.com untuk worker PHP (0) mengarah pada worker yang memiliki IP [prefix IP].x.1.

#### Solusi
- Tambahkan script berikut pada Helter (DNS Server)
```
echo '
zone "riegel.canyon.B25.com" {
        type master;
        file "/etc/bind/jarkom/riegel.canyon.B25.com";
};
zone "granz.channel.B25.com" {
        type master;
        file "/etc/bind/jarkom/granz.channel.B25.com";
};
' >/etc/bind/named.conf.local

mkdir -p /etc/bind/jarkom

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.B25.com. root.riegel.canyon.B25.com. (
                     2023111301         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.B25.com.
@       IN      A       10.21.3.1
' >/etc/bind/jarkom/riegel.canyon.B25.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.B25.com. root.granz.channel.B25.com. (
                     2023111302         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.B25.com.
@       IN      A       10.21.4.1
' >/etc/bind/jarkom/granz.channel.B25.com

service bind9 restart
```

#### Hasil
![image](https://github.com/tigoyoga/Jarkom-Modul-3-B25-2023/assets/88433109/748419d0-57fc-4e9f-b43e-1131b568e557)

### Nomer 1
Lakukan Konfigurasi sesuai dengan peta yang sudah diberikan.

#### Solusi
- Konfigurasi yang dimaksud adalah membuat topologi sesuai soal dengan network configuration yang sudah di set di soal sebelumnya. Setelah itu kita bisa membuat file script.sh di root yang dijalankan di `.bashrc' yang berisi :

Helter (DNS Server)
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install bind9 -y
```

Himmel (DHCP Server)
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server -y
dhcpd --version
```

Aura (DHCP Relay)
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.21.0.0/16
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay start
```

Denken (Database Server)
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install mariadb-server -y
service mysql start
```

Elsen (Load Balancer)
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update && apt-get install nginx php php-fpm -y
apt-get install bind9 -y
apt-get install apache2-utils -y
service nginx start
```

PHP Worker
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update 
apt install nginx php php-fpm -y
apt-get install wget -y
apt-get install unzip -y
service php7.3-fpm start
php -v
service nginx start
```

Laravel Worker
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install mariadb-client -y
#mariadb --host=10.21.2.1 --port=3306 --user=kelompokb25 --password=passwordb25
apt-get install ntp
service ntp restart
curl --insecure -O https://example.com/gpg-key.gpg

apt-get install -y lsb-release ca-certificates apt-transport-https software-pro$
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/p$
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://p$
apt-get update
apt-get install php8.0-mbstring php8.0-xml php8.0-cli php8.0-common php8.0-intl$
apt-get install nginx -y
apt-get install htop -y

service php8.0-fpm start
service nginx start
```

Client
```
apt-get update
apt-get install lynx -y
apt-get install apache2-utils

echo '
search example.org
nameserver 10.21.1.2
nameserver 192.168.122.1
' > /etc/resolv.conf
```

### Nomer 2 - 5
- Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.16 - [prefix IP].3.32 dan [prefix IP].3.64 - [prefix IP].3.80
- Client yang melalui Switch4 mendapatkan range IP dari [prefix IP].4.12 - [prefix IP].4.20 dan [prefix IP].4.160 - [prefix IP].4.168
- Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut
- Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit

#### Solusi
- Tambahkan script pada Himmel :
```
echo '
INTERFACESV4="eth0"
INTERFACESV6=""
' >/etc/default/isc-dhcp-server

echo '
option domain-name "example.org";
option domain-name-servers ns1.example.org, ns2.example.org;

default-lease-time 600;
max-lease-time 7200;

ddns-update-style none;

subnet 10.21.1.0 netmask 255.255.255.0 {
   
}
subnet 10.21.2.0 netmask 255.255.255.0 {
   
}

subnet 10.21.3.0 netmask 255.255.255.0 {
    range 10.21.3.16 10.21.3.32;
    range 10.21.3.64 10.21.3.80;
    option routers 10.21.3.0;
    option broadcast-address 10.21.3.255;
    option domain-name-servers 10.21.1.2;
    default-lease-time 180;
    max-lease-time 5760;
}

subnet 10.21.4.0 netmask 255.255.255.0 {
    range 10.21.4.12 10.21.4.20;
    range 10.21.4.160 10.21.4.168;
    option routers 10.21.4.0;
    option broadcast-address 10.21.4.255;
    option domain-name-servers 10.21.1.2;
    default-lease-time 720;
    max-lease-time 5760;
}' > /etc/dhcp/dhcpd.conf
```
- `subnet 10.21.3.0` adalah jaringan yang melalui Switch 3
- `subnet 10.21.4.0` adalah jaringan yang melalui Switch 4
- `range` digunakan untuk mengatur range IP yang kita bagikan ke client
- `option routers` adalah IP gateway dari router menuju client (melewati switch)
- `option broadcast-address` adalah IP broadcast pada subnet
- `option domain-name-servers` adalah DNS yang ingin kita bagikan pada client
- `default-lease-time` adalah waktu DHCP meminjamkan IP Address pada client. Pada subnet 3 kita set 3 menit (180 s) dan pada subnet 4 kita set 12 menit (720 s)
- `max-lease-time` addalah waktu maksimal yang dialokasikan untuk peminjaman IP Address. Pada kedua subnet kita set 96 menit (5760 s)

- Tambahkan script pada Aura :
```
echo '
SERVERS="10.21.1.1"
INTERFACES="eth1 eth2 eth3 eth4"
OPTIONS=""
' > /etc/default/isc-dhcp-relay

echo '
net.ipv4.ip_forward=1
' > /etc/sysctl.conf

service isc-dhcp-relay restart
```

### Nomer 6
Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3

#### Solusi 
- Lakukan konfigurasi pada setiap worker. Karena scriptnya sama, konfigurasi yang ditampilkan hanya konfigurasi pada worker Lawine saja :
```
mkdir /var/www/jarkom
cp -v -r /root/modul-3/* /var/www/jarkom/
touch /etc/nginx/sites-available/jarkom

echo '
server {

        listen 80;

        root /var/www/jarkom;

        index index.php index.html index.htm;
        server_name 10.21.3.1;

        location / {
                        try_files $uri $uri/ /index.php?$query_string;
        }

        # pass PHP scripts to FastCGI server
        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
    }

    location ~ /\.ht {
                        deny all;
        }

        error_log /var/log/nginx/jarkom_error.log;
        access_log /var/log/nginx/jarkom_access.log;
}' > /etc/nginx/sites-available/jarkom

ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled
rm -rf /etc/nginx/sites-enabled/default
```

### Nomer 7
Kepala suku dari Bredt Region memberikan resource server sebagai berikut:
   a. Lawine, 4GB, 2vCPU, dan 80 GB SSD.
   b. Linie, 2GB, 2vCPU, dan 50 GB SSD.
   c. Lugner 1GB, 1vCPU, dan 25 GB SSD.
aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second.

#### Solusi
- Tambahkan script pada Eisen (Load Balancer) :
```
echo '
# Default menggunakan Round Robin
upstream myweb  {
    server 10.21.3.1 weight=8; #IP Lawine
    server 10.21.3.2 weight=4; #IP Linie
    server 10.21.3.3 weight=1; #IP Lugnar
}

server {
    listen 80;
    server_name granz.channel.B25.com;

    location / {
    proxy_pass http://myweb;
    }
}' > /etc/nginx/sites-available/lb-jarkom-php

ln -s /etc/nginx/sites-available/lb-jarkom-php /etc/nginx/sites-enabled
```
- Untuk weight kita set 8 : 4 : 1 berdasarkan spesifikasi pada soal
- `ab -n 1000 -c 100 http://granz.channel.b25.com/` untuk testing

### Nomer 8
Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:
    a. Nama Algoritma Load Balancer
    b. Report hasil testing pada Apache Benchmark
    c. Grafik request per second untuk masing masing algoritma. 
    d. Analisis

#### Solusi



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
### Nomer-14
### Frieren, Flamme, dan Fern memiliki Riegel Channel sesuai dengan quest guide berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer

- Kami melakukan instalasi laravel dan melakukan deploy pada ketiga worker laravel sebagai berikut 
```
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt-get update
apt-get install php8.0-mbstring php8.0-xml php8.0-cli php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl unzip wget -y
apt-get install nginx -y

```
- selanjutnya melakukan instalasi composer 
```
wget https://getcomposer.org/download/2.0.13/composer.phar
chmod +x composer.phar
mv composer.phar /usr/bin/composer
```
- kemudian melakukan instalasi git dan melakukan clone dari github laravel praktikum yang sudah disediakan
```
apt-get install git -y
cd /var/www
git clone https://github.com/martuafernando/laravel-praktikum-jarkom.git
cd laravel-praktikum-jarkom
composer update
composer install
```
- setelah melakukan clone lakukan konfigurasi sebagai berikut pada masing-masing worker 
```

cp .env.example .env

echo '
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:FMAdHCoIH+DQ7mcVuaRd31G8ZvitSNWM/MIsehhilE0=
APP_DEBUG=true
APP_URL=http://localhost

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=10.21.2.1
DB_PORT=3306
DB_DATABASE=dbkelompokb25
DB_USERNAME=kelompokb25
DB_PASSWORD=passwordb25

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
VITE_PUSHER_HOST="${PUSHER_HOST}"
VITE_PUSHER_PORT="${PUSHER_PORT}"
VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"' > /var/www/laravel-praktikum-jarkom/.env

php artisan migrate:fresh
php artisan db:seed --class=AiringsTableSeeder
php artisan key:generate
php artisan config:cache
php artisan storage:link
php artisan jwt:secret
php artisan config:clear
chown -R www-data.www-data /var/www/laravel-praktikum-jarkom/storage
```
- Setelah itu lakukan konfigurasi **nginx** pada masing masing worker sebagaimana berikut 
```
10.21.4.1:8001; # Frieren
10.21.4.2:8002; # Flamme
10.21.4.3:8003; # Fern

```
- Berikut ini script lengkap nya, contoh pada worker Frieren
```
touch /etc/nginx/sites-available/riegel.canyon.B25.com

echo '
server {

    listen 8001;

    root /var/www/laravel-praktikum-jarkom/public;

    index index.php index.html index.htm;
    server_name _;

    location / {
            try_files $uri $uri/ /index.php?$query_string;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
    }

    location ~ /\.ht {
            deny all;
    }

    error_log /var/log/nginx/implementasi_error.log;
    access_log /var/log/nginx/implementasi_access.log;
}' > /etc/nginx/sites-available/riegel.canyon.B25.com

ln -s /etc/nginx/sites-available/riegel.canyon.B25.com /etc/nginx/sites-enabled/
service php8.0-fpm start
service nginx start
```
### Hasil 
- Lakukan pada salah satu client dan arahkan salah satu worker seperti di arahkan ke Frieren
```
lynx 10.21.4.1:8001

```
![14 1](https://github.com/tigoyoga/Jarkom-Modul-3-B25-2023/assets/101172294/f1b56cf2-f5b6-463e-a763-a33828c9f6b5)


### Riegel Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire.

### Nomer-15
### POST /auth/register 
- Untuk menyelesaikan soal ini, kita perlu melakukan testing pada salah satu worker saja di sini  saya pakai **Frieren** . sebelum testing kita membuat file **register.json** pada root client yang ingin kita melakukan pengetestan , dengan isi file sebagai berikut
```
{
  "username": "kelompokB25",
  "password": "passwordB25"
}

```
- lalu melakukan testing dengan perintah di bawah ini 
```
ab -n 100 -c 10 -p register.json -T application/json http://10.21.4.1:8001/api/auth
```
### Hasil
![15 1](https://github.com/tigoyoga/Jarkom-Modul-3-B25-2023/assets/101172294/ad6e1ddc-5f17-4f8b-99be-60db941cc959)

```
NOTE : hanya berhasil 1 proses karena username dan password tersebut hanya di terima unique atau tidak bisa ganda dan sama.
```
