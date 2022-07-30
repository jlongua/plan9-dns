- [dnslookup](https://github.com/ameshkov/dnslookup)

##### DNS-over-TLS:
```sh
./dnslookup example.org tls://dns.adguard.com
```
##### DNS-over-TLS with IP:
```sh
./dnslookup example.org tls://dns.adguard.com 94.140.14.14
```
##### DNS-over-HTTPS:
```sh
./dnslookup example.org https://dns.adguard.com/dns-query
```
##### DNS-over-HTTPS with IP:
```sh
./dnslookup example.org https://dns.adguard.com/dns-query 94.140.14.14
```
##### DNSCrypt (stamp):
```sh
./dnslookup example.org sdns://AQIAAAAAAAAAFDE3Ni4xMDMuMTMwLjEzMDo1NDQzINErR_JS3PLCu_iZEIbq95zkSV2LFsigxDIuUso_OQhzIjIuZG5zY3J5cHQuZGVmYXVsdC5uczEuYWRndWFyZC5jb20
```
##### DNSCrypt (parameters):
```sh
./dnslookup example.org 176.103.130.130:5443 2.dnscrypt.default.ns1.adguard.com D12B:47F2:52DC:F2C2:BBF8:9910:86EA:F79C:E449:5D8B:16C8:A0C4:322E:52CA:3F39:0873
```
##### DNS-over-QUIC (experimental, uses port 784):
```sh
./dnslookup example.org quic://dns.adguard.com
```
##### Machine-readable format:
```sh
JSON=1 ./dnslookup example.org 94.140.14.14
```
##### Disable certificates verification:
```sh
VERIFY=0 ./dnslookup example.org tls://127.0.0.1
```
##### Specify the type of resource record (default A):
```sh
RRTYPE=AAAA ./dnslookup example.org tls://127.0.0.1
RRTYPE=HTTPS ./dnslookup example.org tls://127.0.0.1
```
##### Specify the class of query (default IN):
```sh
CLASS=CH ./dnslookup example.org tls://127.0.0.1
```
