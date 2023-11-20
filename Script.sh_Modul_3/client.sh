echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install lynx -y
apt-get install apache2-utils
apt-get install jq
# taruh belakang karena untuk testing domain
echo '
search example.org
nameserver 10.21.1.2
nameserver 192.168.122.1
' > /etc/resolv.conf