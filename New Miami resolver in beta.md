### teardown and rebuilding without docker
- problems with unwanted connections from amazon being established with unbound when enabling ipv6 in docker
- trying knot-resolver and encrypted-dns

## Miami, Florida dns resolver in beta testing
- dns-crypt, anonymization, ipv4 and ipv6
- doh ipv4 and ipv6

### Logging policy for Miami resolver
- dnscrypt protocol - no logs
- doh-proxy - no logs
- nginx access and error logs used to tune nginx while in BETA testing. 

the software used is:
- encrypted-dns
- knot-resolver
- nginx, LE certs via dns api and lexicon
- m13253/dns-over-https doh-proxy
- prometheus

### Miami, Florida
### dnscrypt ipv4 port:8443
#### NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.

```sh
DNS Stamp: 

DNS Stamp for Anonymized DNS relaying: 
```

### dnscrypt ipv6 port:8443
#### NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.

```sh
DNS Stamp: 

DNS Stamp for Anonymized DNS relaying: 
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
