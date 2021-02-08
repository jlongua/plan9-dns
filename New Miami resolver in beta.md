### teardown and rebuilding without docker
- problems with unwanted connections from amazon being established with unbound when enabling ipv6 in docker
- trying knot-resolver and encrypted-dns
- knot-resolver 5.2.0 natively supports dot and doh2

## Miami, Florida dns resolver in beta testing
- dns-crypt, anonymization, ipv4 and ipv6
- doh ipv4 and ipv6
- dot ipv4 and ipv6

### Logging policy for Miami resolver
- dnscrypt protocol - no logs
- knot-resolver doh2 - no logs
- knot-resolver dot - no logs

### the software used is:
- encrypted-dns
- knot-resolver
- LE certs via dns api and lexicon
- prometheus

### Miami, Florida
### dnscrypt ipv4 port:8443
#### NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.

```sh
DNS Stamp: sdns://AQcAAAAAAAAAEzEwNC4xNTYuMjQ2LjM5Ojg0NDMguTbAKGMCYplJFnHbHEZ2G1-hNLg9Zb5BYRVx6_hjI8kiMi5kbnNjcnlwdC1jZXJ0LmRvaDEucGxhbjktZG5zLmNvbQ

DNS Stamp for Anonymized DNS relaying: sdns://gRMxMDQuMTU2LjI0Ni4zOTo4NDQz
```

### dnscrypt ipv6 port:8443
#### NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.

```sh
DNS Stamp: sdns://AQcAAAAAAAAAIlsyMDAxOjE5ZjA6OTAwMjoyYTE4OjU0MDA6OjFdOjg0NDMguTbAKGMCYplJFnHbHEZ2G1-hNLg9Zb5BYRVx6_hjI8kiMi5kbnNjcnlwdC1jZXJ0LmRvaDEucGxhbjktZG5zLmNvbQ

DNS Stamp for Anonymized DNS relaying: sdns://gSJbMjAwMToxOWYwOjkwMDI6MmExODo1NDAwOjoxXTo4NDQz
```

## not rebuilt yet
### doh-proxy 104.156.246.39 port 443
### Firefox settings:
- network.trr.uri	https://doh1.plan9-dns.com/dns-query
#### other settings I used:
- network.trr.custom_uri	https://doh1.plan9-dns.com/dns-query
- network.trr.bootstrapAddress	104.156.246.39
- network.trr.mode	3
- network.trr.resolvers	[{ "name": "doh1.plan9-dns", "url": "https://doh1.plan9-dns.com/dns-query" }]

### dnscrypt-proxy doh settings:
#### NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.
### ipv4

```sh
stamp = 
```

### ipv6

```sh
stamp =
```
