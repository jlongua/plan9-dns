### Miami, Florida dns resolver in beta testing
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

### doh2
#### tls 1.3 and h2 only

#### doh-proxy 104.156.246.39 port 443
#### Firefox settings:
- network.trr.uri	https://doh1.plan9-dns.com/dns-query
##### other settings I used:
- network.trr.custom_uri	https://doh1.plan9-dns.com/dns-query
- network.trr.bootstrapAddress	104.156.246.39
- network.trr.mode	3
- network.trr.resolvers	[{ "name": "doh1.plan9-dns", "url": "https://doh1.plan9-dns.com/dns-query" }]

### dnscrypt-proxy doh settings:
#### NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.
#### certificate hash: Let's Encrypt R3: 3286ff65a65faf32085eea1388c3738ba7e37873c906cce3c4a28b4cc2a58988
#### ipv4

```sh
stamp = sdns://AgcAAAAAAAAADjEwNC4xNTYuMjQ2LjM5IDKG_2WmX68yCF7qE4jDc4un43hzyQbM48Sii0zCpYmIEmRvaDEucGxhbjktZG5zLmNvbQovZG5zLXF1ZXJ5
```

#### ipv6

```sh
stamp = sdns://AgcAAAAAAAAAHVsyMDAxOjE5ZjA6OTAwMjoyYTE4OjU0MDA6OjFdIDKG_2WmX68yCF7qE4jDc4un43hzyQbM48Sii0zCpYmIEmRvaDEucGxhbjktZG5zLmNvbQovZG5zLXF1ZXJ5
```

### dot
- 104.156.246.39 port 853
- doh1.plan9-dns.com

- spki if needed
```sh
$ echo | openssl s_client -connect '104.156.246.39:853' 2>/dev/null | openssl x509 -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64
zIvEJpuYVlmdTCoRF1hG8RiA9DKV5HBlUWzsPIBGJh8=
```
