Thanks to Frank Denis and other contributors for making this project possible.\
[DNSCrypt](https://dnscrypt.info)

### New Jersey resolver
Protocols: dnscrypt v2 plus anonymization, (doh coming soon) \
IP: 173.199.126.35 port: 443 \
Provider name: 2.dnscrypt-cert.plan9-dns
##### dnscrypt stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAEjE3My4xOTkuMTI2LjM1OjQ0MyCS8B98_Phukw8hJOslzJhsbrLO5xnxZ5B67ZuFTknPUhkyLmRuc2NyeXB0LWNlcnQucGxhbjktZG5zr 

DNS Stamp for Anonymized DNS relaying: sdns://gRIxNzMuMTk5LjEyNi4zNTo0NDM
```
### Florida resolver
Protocols: dnscrypt v2 plus anonymization, doh2, and dot \
IP: 45.63.110.187 port:8443\
    2001:19f0:9002:1d74:5400::1 port: 8443 \
Provider name: 2.dnscrypt-cert.draco.plan9-ns2.com
##### dnscrypt ipv4 stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAEjQ1LjYzLjExMC4xODc6ODQ0MyA2IkjVtzrJwMH8G2LfnJ-biUx869AnsX1oKNftwiw-ICMyLmRuc2NyeXB0LWNlcnQuZHJhY28ucGxhbjktbnMyLmNvbQ

DNS Stamp for Anonymized DNS relaying: sdns://gRI0NS42My4xMTAuMTg3Ojg0NDM
```
##### dnscrypt ipv6 stamps
```sh
DNS Stamp: sdns://AQcAAAAAAAAAIlsyMDAxOjE5ZjA6OTAwMjoxZDc0OjU0MDA6OjFdOjg0NDMgNiJI1bc6ycDB_Bti35yfm4lMfOvQJ7F9aCjX7cIsPiAjMi5kbnNjcnlwdC1jZXJ0LmRyYWNvLnBsYW45LW5zMi5jb20

DNS Stamp for Anonymized DNS relaying: sdns://gSJbMjAwMToxOWYwOjkwMDI6MWQ3NDo1NDAwOjoxXTo4NDQz
```
##### doh2 dnscrypt ipv4 stamp
IP: 45.63.110.187 port: 443
```sh
DNS Stamp: sdns://AgcAAAAAAAAADTQ1LjYzLjExMC4xODcgMob_ZaZfrzIIXuoTiMNzi6fjeHPJBszjxKKLTMKliYgTZHJhY28ucGxhbjktbnMyLmNvbQovZG5zLXF1ZXJ5
``` 
##### doh2 dnscrypt ipv6 stamp
IP: 2001:19f0:9002:1d74:5400::1 port: 443
```sh
DNS Stamp: sdns://AgcAAAAAAAAAHVsyMDAxOjE5ZjA6OTAwMjoxZDc0OjU0MDA6OjFdIDKG_2WmX68yCF7qE4jDc4un43hzyQbM48Sii0zCpYmIE2RyYWNvLnBsYW45LW5zMi5jb20KL2Rucy1xdWVyeQ
```
##### doh2 Firefox settings:
– network.trr.uri https://draco.plan9-ns2.com/dns-query \
– network.trr.bootstrapAddress 45.63.110.187 \
– network.trr.mode 3

##### dot
– IP: 45.63.110.187 port 853 \
– IP: 2001:19f0:9002:1d74:5400::1 port: 853 \
– draco.plan9-ns2.com

– spki: YCDBCR2KtlxiQaOQKYhqND47jubbTEuEAo9+E/wUUuU=
