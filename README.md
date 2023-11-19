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

  
