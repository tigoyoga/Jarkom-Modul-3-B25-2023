echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install bind9 -y
echo '
zone "riegel.canyon.B25.com" {
	type master;
	file "/etc/bind/jarkom/riegel.canyon.B25.com";
};
	type master;
	file "/etc/bind/jarkom/granz.channel.B25.com";
};
' >/etc/bind/named.conf.local

mkdir /etc/bind/jarkom

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
@       IN      A       10.21.2.2 
@       IN      AAAA    ::1

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
@       IN      A       10.21.2.2
@       IN      AAAA    ::1

' >/etc/bind/jarkom/granz.channel.B25.com
service bind9 restart