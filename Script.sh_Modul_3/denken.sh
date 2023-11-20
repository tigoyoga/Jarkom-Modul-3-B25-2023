echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install mariadb-server -y
service mysql start

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

exit

mysql -u kelompokb25 -p

SHOW DATABASES;

exit

# no 13

echo '
[client-server]

# Import all .cnf files from configuration directory
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

[mysqld]
skip-networking=0
skip-bind-address ' >/etc/mysql/my.cnf


service mysql restart