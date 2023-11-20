apt-get update 
apt install nginx php php-fpm -y
apt-get install wget -y
apt-get install unzip -y
service php7.3-fpm start
php -v
service nginx start
mkdir /var/www/jarkom
cp -v -r /root/modul-3/* /var/www/jarkom/
touch /etc/nginx/sites-available/jarkom
apt-get install  htop

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

service php7.3-fpm restart
service nginx restart