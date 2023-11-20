echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server -y
dhcpd --version

echo '
INTERFACESV4="eth0"
INTERFACESV6=""
' >/etc/default/isc-dhcp-server

echo '
#hcpd.conf
#
# Sample configuration file for ISC dhcpd
#

# option definitions common to all supported networks...
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
}

host fieren {
    hardware ethernet 0a:9d:17:b8:c4:08;
    fixed-address 10.21.4.1;
    option domain-name-servers 192.168.122.1;
}

host flamme{
    hardware ethernet 2a:77:88:92:03:4b;
    fixed-address 10.21.4.2;
    option domain-name-servers 192.168.122.1;
}

host fern {
    hardware ethernet f2:a0:58:fe:fd:00;
    fixed-address 10.21.4.3;
    option domain-name-servers 192.168.122.1;
}

host lawine {
    hardware ethernet ce:4f:fa:0a:55:1b;
    fixed-address 10.21.3.1;
    option domain-name-servers 192.168.122.1;
}

host linie {
    hardware ethernet b6:49:b2:00:58:cf;
    fixed-address 10.21.3.2;
    option domain-name-servers 192.168.122.1;
}

host lugner {
    hardware ethernet 7a:f7:4c:c5:31:02;
    fixed-address 10.21.3.3;
    option domain-name-servers 192.168.122.1;
}

host heiter {
    hardware ethernet aa:51:3e:f6:ca:be;
    fixed-address 10.21.1.2;
    option domain-name-servers 192.168.122.1;
    option routers 10.21.1.0;
}

host denken {
    hardware ethernet 76:b9:f0:24:43:e3;
    fixed-address 10.21.2.1;
    option domain-name-servers 192.168.122.1;
    option routers 10.21.2.0;
}

host elsen {
    hardware ethernet f2:a7:a2:ef:b1:f0;
    fixed-address 10.21.2.2;
    option domain-name-servers 192.168.122.1;
    option routers 10.21.2.0;
}


' >/etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
