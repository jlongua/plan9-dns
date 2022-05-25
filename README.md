Thanks to Frank Denis and other contributors for making this project possible.
- [DNSCrypt](https://dnscrypt.info)
- [SDNS 2021](https://www.youtube.com/playlist?list=PLDlEgzZB7eyJ0_Y2U2Y3Vv5kjj7DmeBIM)
- [plan9-dns Github](https://github.com/jlongua/plan9-dns)

## May 25th 2022 New Mexico resolver in beta testing
### Mexico City, Mexico resolver
#### Abuse and Privacy [policy](https://github.com/jlongua/plan9-dns/blob/main/privacy%20policy.md)

Protocols: dnscrypt v2 plus anonymization, and doh2 and dot

#### DNSCrypt
Provider name: 2.dnscrypt-cert.helios.plan9-dns.com\
IPv4: 216.238.80.219 port:8443\
IPv6: 2001:19f0:b400:17d1:5400::1 port:8443

##### dnscrypt ipv4 stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAEzIxNi4yMzguODAuMjE5Ojg0NDMgcEnNRxbM5Ho_Vq7uAq2kNgqYpuMsSbrBXC506a5fpcokMi5kbnNjcnlwdC1jZXJ0LmhlbGlvcy5wbGFuOS1kbnMuY29t
DNS Stamp for Anonymized DNS relaying: sdns://gRMyMTYuMjM4LjgwLjIxOTo4NDQz
```
##### dnscrypt ipv6 stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAIlsyMDAxOjE5ZjA6YjQwMDoxN2QxOjU0MDA6OjFdOjg0NDMgcEnNRxbM5Ho_Vq7uAq2kNgqYpuMsSbrBXC506a5fpcokMi5kbnNjcnlwdC1jZXJ0LmhlbGlvcy5wbGFuOS1kbnMuY29t
DNS Stamp for Anonymized DNS relaying: sdns://gSJbMjAwMToxOWYwOmI0MDA6MTdkMTo1NDAwOjoxXTo4NDQz
```
##### doh2 dnscrypt ipv4 stamp
IPv4: 216.238.80.219 port:443
```sh
sdns://AgcAAAAAAAAADjIxNi4yMzguODAuMjE5IJo6NPcn3rm8pRAD2c6cOfjyfdnFJCkBwrqxpE5jWgIZFGhlbGlvcy5wbGFuOS1kbnMuY29tCi9kbnMtcXVlcnk
```
##### doh2 dnscrypt ipv6 stamp
IPv6: 2001:19f0:b400:17d1:5400::1 port:443
```sh
sdns://AgcAAAAAAAAAHVsyMDAxOjE5ZjA6YjQwMDoxN2QxOjU0MDA6OjFdIJo6NPcn3rm8pRAD2c6cOfjyfdnFJCkBwrqxpE5jWgIZFGhlbGlvcy5wbGFuOS1kbnMuY29tCi9kbnMtcXVlcnk
```
##### doh2 Firefox settings:
about:config\
– network.trr.uri https://helios.plan9-dns.com/dns-query \
– network.trr.mode 3

##### dot
– IP: 216.238.80.219 port:853\
– IP: 2001:19f0:b400:17d1:5400::1 port:853\
– helios.plan9-dns.com

– spki: pin-sha256="JCdojGRg8TPvBpIcr+NKwTl8d98FsiEkrOZ8cKcX3Qo="

### New Jersey resolver
#### Abuse and Privacy [policy](https://github.com/jlongua/plan9-dns/blob/main/privacy%20policy.md)

Protocols: dnscrypt v2 plus anonymization, and doh2

#### DNSCrypt
Provider name: 2.dnscrypt-cert.plan9-dns\
IP: 173.199.126.35 port:443
##### dnscrypt stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAEjE3My4xOTkuMTI2LjM1OjQ0MyCS8B98_Phukw8hJOslzJhsbrLO5xnxZ5B67ZuFTknPUhkyLmRuc2NyeXB0LWNlcnQucGxhbjktZG5z

DNS Stamp for Anonymized DNS relaying: sdns://gRIxNzMuMTk5LjEyNi4zNTo0NDM
```
##### doh dnscrypt stamp
IP: 173.199.126.35 port:443
```sh
DNS Stamp: sdns://AgcAAAAAAAAADjE3My4xOTkuMTI2LjM1IDKG_2WmX68yCF7qE4jDc4un43hzyQbM48Sii0zCpYmIE2h5ZHJhLnBsYW45LW5zMS5jb20KL2Rucy1xdWVyeQ
```
##### doh Firefox settings:
– network.trr.uri https://hydra.plan9-ns1.com/dns-query \
– network.trr.mode 3

### Florida resolver
#### Abuse and Privacy [policy](https://github.com/jlongua/plan9-dns/blob/main/privacy%20policy.md)

Protocols: dnscrypt v2 plus anonymization, doh2, and dot

#### DNSCrypt
Provider name: 2.dnscrypt-cert.plan9-ns2.com\
IP: 45.63.110.187 port:8443\
2001:19f0:9002:1d74:5400::1 port:8443
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
##### doh2 dnscrypt ipv4 stamp
IP: 45.63.110.187 port:443
```sh
DNS Stamp: sdns://AgcAAAAAAAAADTQ1LjYzLjExMC4xODcgMob_ZaZfrzIIXuoTiMNzi6fjeHPJBszjxKKLTMKliYgTZHJhY28ucGxhbjktbnMyLmNvbQovZG5zLXF1ZXJ5
``` 
##### doh2 dnscrypt ipv6 stamp
IP: 2001:19f0:9002:1d74:5400::1 port:443
```sh
DNS Stamp: sdns://AgcAAAAAAAAAHVsyMDAxOjE5ZjA6OTAwMjoxZDc0OjU0MDA6OjFdIDKG_2WmX68yCF7qE4jDc4un43hzyQbM48Sii0zCpYmIE2RyYWNvLnBsYW45LW5zMi5jb20KL2Rucy1xdWVyeQ
```
##### doh2 Firefox settings:
– network.trr.uri https://draco.plan9-ns2.com/dns-query \
– network.trr.mode 3

##### dot
– IP: 45.63.110.187 port 853 \
– IP: 2001:19f0:9002:1d74:5400::1 port:853 \
– draco.plan9-ns2.com

– spki: pin-sha256="YCDBCR2KtlxiQaOQKYhqND47jubbTEuEAo9+E/wUUuU="
