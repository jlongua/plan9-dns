Thanks to Frank Denis and other contributors for making this project possible.
- [DNSCrypt](https://dnscrypt.info)
- [SDNS 2021](https://www.youtube.com/playlist?list=PLDlEgzZB7eyJ0_Y2U2Y3Vv5kjj7DmeBIM)
- [plan9-dns Github](https://github.com/jlongua/plan9-dns)
- [Knot Resolver Read the Docs](https://knot-resolver.readthedocs.io/en/stable/index.html)
- [Knot Resolver Gitlab](https://github.com/CZ-NIC/knot-resolver)


### New Jersey, USA resolver
#### Abuse and Privacy [policy](https://github.com/jlongua/plan9-dns/blob/main/privacy%20policy.md)

Protocols: dnscrypt v2 plus anonymization, and doh and dot

#### DNSCrypt
Provider name: 2.dnscrypt-cert.kronos.plan9-dns.com\
IPv4: 207.246.87.96 port:8443\
IPv6: 2001:19f0:5:3bd7:5400:4ff:fe05:da83 port:8443

##### dnscrypt ipv4 stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAEjIwNy4yNDYuODcuOTY6ODQ0MyCtk9t3hxvHvzfcFYkfJEmYVa4ieLrxGZlYLHBXA7P2OiQyLmRuc2NyeXB0LWNlcnQua3Jvbm9zLnBsYW45LWRucy5jb20
DNS Stamp for Anonymized DNS relaying: sdns://gRIyMDcuMjQ2Ljg3Ljk2Ojg0NDM
```
##### dnscrypt ipv6 stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAKlsyMDAxOjE5ZjA6NTozYmQ3OjU0MDA6NGZmOmZlMDU6ZGE4M106ODQ0MyCtk9t3hxvHvzfcFYkfJEmYVa4ieLrxGZlYLHBXA7P2OiQyLmRuc2NyeXB0LWNlcnQua3Jvbm9zLnBsYW45LWRucy5jb20
DNS Stamp for Anonymized DNS relaying: sdns://gSpbMjAwMToxOWYwOjU6M2JkNzo1NDAwOjRmZjpmZTA1OmRhODNdOjg0NDM
```
##### doh dnscrypt ipv4 stamp
IPv4: 207.246.87.96 port:443
```sh
DNS Stamp: sdns://AgcAAAAAAAAADTIwNy4yNDYuODcuOTYgmjo09yfeubylEAPZzpw5-PJ92cUkKQHCurGkTmNaAhkUa3Jvbm9zLnBsYW45LWRucy5jb20KL2Rucy1xdWVyeQ
```
##### doh dnscrypt ipv6 stamp
IPv6: 2001:19f0:5:3bd7:5400:4ff:fe05:da83 port:443
```sh
DNS Stamp: sdns://AgcAAAAAAAAAJVsyMDAxOjE5ZjA6NTozYmQ3OjU0MDA6NGZmOmZlMDU6ZGE4M10gmjo09yfeubylEAPZzpw5-PJ92cUkKQHCurGkTmNaAhkUa3Jvbm9zLnBsYW45LWRucy5jb20KL2Rucy1xdWVyeQ
```
##### certificate hash
```sh
[CN=ZeroSSL ECC Domain Secure Site CA,O=ZeroSSL,C=AT]: 9a3a34f727deb9bca51003d9ce9c39f8f27dd9c5242901c2bab1a44e635a0219
```
##### doh Firefox settings:
about:config\
– network.trr.uri https://kronos.plan9-dns.com/dns-query \
– network.trr.mode 3

##### dot
– IPv4: 207.246.87.96 port:853\
– IPv6: 2001:19f0:5:3bd7:5400:04ff:fe05:da83 port:853\
– kronos.plan9-dns.com

spki pin
```sh
gnutls-cli --print-cert -p 853 kronos.plan9-dns.com | grep "pin-sha256" | head -1
 - subject `CN=plan9-dns.com', issuer `CN=ZeroSSL ECC Domain Secure Site CA,O=ZeroSSL,C=AT', serial 0x0094dc926e2b8a814758cf41589c5bd188, EC/ECDSA key 256 bits, signed using ECDSA-SHA384, activated `2022-05-23 00:00:00 UTC', expires `2022-08-21 23:59:59 UTC', pin-sha256="JCdojGRg8TPvBpIcr+NKwTl8d98FsiEkrOZ8cKcX3Qo=
```


### Mexico City, Mexico resolver
#### Abuse and Privacy [policy](https://github.com/jlongua/plan9-dns/blob/main/privacy%20policy.md)

Protocols: dnscrypt v2 plus anonymization, and doh and dot

#### DNSCrypt
Provider name: 2.dnscrypt-cert.helios.plan9-dns.com\
IPv4: 216.238.80.219 port:8443\
IPv6: 2001:19f0:b400:17d1:5400:4ff:fe00:1267 port:8443

##### dnscrypt ipv4 stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAEzIxNi4yMzguODAuMjE5Ojg0NDMgcEnNRxbM5Ho_Vq7uAq2kNgqYpuMsSbrBXC506a5fpcokMi5kbnNjcnlwdC1jZXJ0LmhlbGlvcy5wbGFuOS1kbnMuY29t
DNS Stamp for Anonymized DNS relaying: sdns://gRMyMTYuMjM4LjgwLjIxOTo4NDQz
```
##### dnscrypt ipv6 stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAALVsyMDAxOjE5ZjA6YjQwMDoxN2QxOjU0MDA6NGZmOmZlMDA6MTI2N106ODQ0MyBwSc1HFszkej9Wru4CraQ2Cpim4yxJusFcLnTprl-lyiQyLmRuc2NyeXB0LWNlcnQuaGVsaW9zLnBsYW45LWRucy5jb20
DNS Stamp for Anonymized DNS relaying: sdns://gS1bMjAwMToxOWYwOmI0MDA6MTdkMTo1NDAwOjRmZjpmZTAwOjEyNjddOjg0NDM
```
##### doh dnscrypt ipv4 stamp
IPv4: 216.238.80.219 port:443
```sh
DNS Stamp: sdns://AgcAAAAAAAAADjIxNi4yMzguODAuMjE5IJo6NPcn3rm8pRAD2c6cOfjyfdnFJCkBwrqxpE5jWgIZFGhlbGlvcy5wbGFuOS1kbnMuY29tCi9kbnMtcXVlcnk
```
##### doh dnscrypt ipv6 stamp
IPv6: 2001:19f0:b400:17d1:5400:4ff:fe00:1267 port:443
```sh
DNS Stamp: sdns://AgcAAAAAAAAAKFsyMDAxOjE5ZjA6YjQwMDoxN2QxOjU0MDA6NGZmOmZlMDA6MTI2N10gmjo09yfeubylEAPZzpw5-PJ92cUkKQHCurGkTmNaAhkUaGVsaW9zLnBsYW45LWRucy5jb20KL2Rucy1xdWVyeQ
```
##### certificate hash
```sh
[CN=ZeroSSL ECC Domain Secure Site CA,O=ZeroSSL,C=AT]: 9a3a34f727deb9bca51003d9ce9c39f8f27dd9c5242901c2bab1a44e635a0219
```
##### doh Firefox settings:
about:config\
– network.trr.uri https://helios.plan9-dns.com/dns-query \
– network.trr.mode 3

##### dot
– IPv4: 216.238.80.219 port:853\
– IPv6: 2001:19f0:b400:17d1:5400::1 port:853\
– helios.plan9-dns.com

– spki: pin-sha256="JCdojGRg8TPvBpIcr+NKwTl8d98FsiEkrOZ8cKcX3Qo="



### Florida resolver
#### Abuse and Privacy [policy](https://github.com/jlongua/plan9-dns/blob/main/privacy%20policy.md)

Protocols: dnscrypt v2 plus anonymization, doh, and dot

#### DNSCrypt
Provider name: 2.dnscrypt-cert.plan9-ns2.com\
IPv4: 45.63.110.187 port:8443\
IPv6: 2001:19f0:9002:1d74:5400::1 port:8443
##### dnscrypt ipv4 stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAEjQ1LjYzLjExMC4xODc6ODQ0MyCcjeRhPcJTsKhZ8iViALPd39CussG6SnprFT9z_1f03x0yLmRuc2NyeXB0LWNlcnQucGxhbjktbnMyLmNvbQ
DNS Stamp for Anonymized DNS relaying: sdns://gRI0NS42My4xMTAuMTg3Ojg0NDM
```
##### dnscrypt ipv6 stamps
```sh
DNS Stamp: 
sdns://AQcAAAAAAAAALVsyMDAxOjE5ZjA6OTAwMjoxZDc0OjU0MDA6M2ZmOmZlMzU6Nzc0YV06ODQ0MyCcjeRhPcJTsKhZ8iViALPd39CussG6SnprFT9z_1f03x0yLmRuc2NyeXB0LWNlcnQucGxhbjktbnMyLmNvbQ
DNS Stamp for Anonymized DNS relaying: sdns://gS1bMjAwMToxOWYwOjkwMDI6MWQ3NDo1NDAwOjNmZjpmZTM1Ojc3NGFdOjg0NDM
```
##### doh dnscrypt ipv4 stamp
IPv4: 45.63.110.187 port:443
```sh
DNS Stamp: sdns://AgcAAAAAAAAADTQ1LjYzLjExMC4xODcgRE69Z7uD-IB7OSHpOKyReLiCvVCq2xEjHwRM9fCN984TZHJhY28ucGxhbjktbnMyLmNvbQovZG5zLXF1ZXJ5
``` 
##### doh dnscrypt ipv6 stamp
IPv6: 2001:19f0:9002:1d74:5400::1 port:443
```sh
DNS Stamp: sdns://AgcAAAAAAAAAHVsyMDAxOjE5ZjA6OTAwMjoxZDc0OjU0MDA6OjFdIEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOE2RyYWNvLnBsYW45LW5zMi5jb20KL2Rucy1xdWVyeQ
```
##### doh Firefox settings:
– network.trr.uri https://draco.plan9-ns2.com/dns-query \
– network.trr.mode 3

##### dot
– IPv4: 45.63.110.187 port 853 \
– IPv6: 2001:19f0:9002:1d74:5400::1 port:853 \
– draco.plan9-ns2.com

– spki: pin-sha256="YCDBCR2KtlxiQaOQKYhqND47jubbTEuEAo9+E/wUUuU="
