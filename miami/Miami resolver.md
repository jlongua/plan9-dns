## plan9-ns2
### Miami, Florida

#### server ip
- 45.63.110.187
- 2001:19f0:9002:1d74:5400::1

#### protocols
- dns-crypt v2, anonymization, ipv4/ipv6
- doh2 ipv4/ipv6
- dot ipv4/ipv6

### Logging policy for Miami resolver
- dnscrypt v2 protocol - no logs
- knot-resolver doh2 - no logs
- knot-resolver dot - no logs

### the software used is:
- encrypted-dns v0.3.23
- knot-resolver v5.3.2
- acme.sh dns alias for LE certs
- prometheus

### ipv4 dnscrypt port:8443

```sh
DNS Stamp: sdns://AQcAAAAAAAAAEjQ1LjYzLjExMC4xODc6ODQ0MyCcjeRhPcJTsKhZ8iViALPd39CussG6SnprFT9z_1f03x0yLmRuc2NyeXB0LWNlcnQucGxhbjktbnMyLmNvbQ

DNS Stamp for Anonymized DNS relaying: sdns://gRI0NS42My4xMTAuMTg3Ojg0NDM
```

### ipv6 dnscrypt port:8443

```sh
DNS Stamp: sdns://AQcAAAAAAAAAIlsyMDAxOjE5ZjA6OTAwMjoxZDc0OjU0MDA6OjFdOjg0NDMgnI3kYT3CU7CoWfIlYgCz3d_QrrLBukp6axU_c_9X9N8dMi5kbnNjcnlwdC1jZXJ0LnBsYW45LW5zMi5jb20

DNS Stamp for Anonymized DNS relaying: sdns://gSJbMjAwMToxOWYwOjkwMDI6MWQ3NDo1NDAwOjoxXTo4NDQz
```

### doh2
#### tls 1.3 and h2 only

#### doh-proxy 45.63.110.187 port 443
#### Firefox settings:
- network.trr.uri	https://draco.plan9-ns2.com/dns-query
##### other settings I used:
- network.trr.custom_uri	https://draco.plan9-ns2.com/dns-query
- network.trr.bootstrapAddress	45.63.110.187
- network.trr.mode	3
- network.trr.resolvers	[{ "name": "draco.plan9-ns2", "url": "https://draco.plan9-ns2.com/dns-query" }]

### dnscrypt doh settings:
#### certificate hash: Let's Encrypt R3: 3286ff65a65faf32085eea1388c3738ba7e37873c906cce3c4a28b4cc2a58988
#### ipv4

```sh
stamp = sdns://AgcAAAAAAAAADTQ1LjYzLjExMC4xODcgMob_ZaZfrzIIXuoTiMNzi6fjeHPJBszjxKKLTMKliYgTZHJhY28ucGxhbjktbnMyLmNvbQovZG5zLXF1ZXJ5
```

#### ipv6
```sh
stamp = sdns://AgcAAAAAAAAAHVsyMDAxOjE5ZjA6OTAwMjoxZDc0OjU0MDA6OjFdIDKG_2WmX68yCF7qE4jDc4un43hzyQbM48Sii0zCpYmIE2RyYWNvLnBsYW45LW5zMi5jb20KL2Rucy1xdWVyeQ
```

### dot
- 45.63.110.187 port 853
- draco.plan9-ns2.com

- spki if needed
```sh
$ echo | openssl s_client -connect '45.63.110.187:853' 2>/dev/null | openssl x509 -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64
YCDBCR2KtlxiQaOQKYhqND47jubbTEuEAo9+E/wUUuU=
```
