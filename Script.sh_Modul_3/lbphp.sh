
# Round Robin
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
                proxy_pass http://backend;
                proxy_set_header    X-Real-IP $remote_addr;
                proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header    Host $http_host;
        }

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}' > /etc/nginx/sites-available/lb-jarkom

# Least Connection
echo '
#Least Connection
upstream backend  {
least_conn;
server 10.21.3.1; #IP Lawine
server 10.21.3.2; #IP Linie
server 10.21.3.3; #IP Lugnar
}

server {
listen 80;
server_name granz.channel.B25.com;

        location / {
                proxy_pass http://backend;
                proxy_set_header    X-Real-IP $remote_addr;
                proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header    Host $http_host;
        }

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}' > /etc/nginx/sites-available/lb-jarkom

# IP Hash
echo '
# IP Hash
upstream backend  {
    ip_hash;
    server 10.21.3.1; #IP Lawine
    server 10.21.3.2; #IP Linie
    server 10.21.3.3; #IP Lugnar
}

server {
    listen 80;
    server_name granz.channel.B25.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header    X-Real-IP $remote_addr;
        proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header    Host $http_host;
    }

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}' > /etc/nginx/sites-available/lb-jarkom

# Generic Hash
echo '
upstream backend  {
    hash $request_uri consistent;
    server 10.21.3.1; #IP Lawine
    server 10.21.3.2; #IP Linie
    server 10.21.3.3; #IP Lugnar
}

server {
    listen 80;
    server_name granz.channel.B25.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header    X-Real-IP $remote_addr;
        proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header    Host $http_host;
    }

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;
}
' > /etc/nginx/sites-available/lb-jarkom




apt-get update && apt install nginx php php-fpm -y
apt-get install bind9 nginx -y
nginx -t
apt-get install apache2-utils -y
apt-get install htop -y
touch /etc/nginx/sites-available/lb-jarkom-php

echo '
# Default menggunakan Round Robin
upstream myweb  {
    server 10.21.3.1; #IP Lawine
    server 10.21.3.2; #IP Linie
    server 10.21.3.3; #IP Lugnar
}

server {
    listen 80;
    server_name granz.channel.B25.com;

    location / {
    proxy_pass http://myweb;
    }
}' > /etc/nginx/sites-available/lb-jarkom-php

ln -s /etc/nginx/sites-available/lb-jarkom-php /etc/nginx/sites-enabled
#no 10
htpasswd -cb /etc/nginx/.htpasswd netics ajkb25

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
            proxy_pass http://backend;
            proxy_set_header    X-Real-IP $remote_addr;
            proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header    Host $http_host;

            auth_basic "Administrator'\''s Area";
            auth_basic_user_file /etc/nginx/.htpasswd;
        }

        location ~ /\.ht {
            deny all;
        }

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}' > /etc/nginx/sites-available/lb-jarkom-php
#no 11
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
            proxy_pass http://backend;
            proxy_set_header    X-Real-IP $remote_addr;
            proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header    Host $http_host;

            auth_basic "Administrator'\''s Area";
            auth_basic_user_file /etc/nginx/.htpasswd;
        }

        location ~ /\.ht {
            deny all;
        }

        location /its {
           proxy_pass https://www.its.ac.id;
          
        }

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}' > /etc/nginx/sites-available/lb-jarkom-php
#no 12
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
            allow       10.21.3.69;
            allow       10.21.3.70;
            allow       10.21.4.167;
            allow       10.21.4.178;
            deny        all;

            proxy_pass http://backend;
            proxy_set_header    X-Real-IP $remote_addr;
            proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header    Host $http_host;

            auth_basic "Administrator'\''s Area";
            auth_basic_user_file /etc/nginx/.htpasswd;
        }

        location ~ /\.ht {
            deny all;
        }

        location /its {
            proxy_pass https://www.its.ac.id;
        }

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}' > /etc/nginx/sites-available/lb-jarkom-php

# ngatur dns laravel
touch /etc/nginx/sites-available/lb-jarkom-laravel

echo '
upstream laravel {
        least_conn;
        server 10.21.4.1:8001;
        server 10.21.4.2:8002;
        server 10.21.4.3:8003;
}

server {
        listen 80;
        server_name riegel.canyon.B25.com;

        location / {
                proxy_pass http://laravel;
        }

}' > /etc/nginx/sites-available/lb-jarkom-laravel

ln -s /etc/nginx/sites-available/lb-jarkom-laravel /etc/nginx/sites-enabled

echo '
[www]
user = www-data
group = www-data
listen = /run/php/php7.3-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3' > /etc/php/7.3/fpm/pool.d/www.conf

service php7.3-fpm start
service php7.3-fpm restart
service nginx restart