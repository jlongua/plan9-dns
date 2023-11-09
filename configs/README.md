### Piscataway, New Jersey, USA - kronos.plan9-dns.com
#### unpublished dnscrypt ipv6 stamp
[static.'kronos-ipv6']  
stamp = 'sdns://AQcAAAAAAAAAKlsyMDAxOjE5ZjA6NTozYmQ3OjU0MDA6NGZmOmZlMDU6ZGE4M106ODQ0MyCwmQlIDpKk8SiiyrJbPgKhHxCrBJLb8ZWlu6tvr1KvkyQyLmRuc2NyeXB0LWNlcnQua3Jvbm9zLnBsYW45LWRucy5jb20'
### Miami, Florida USA - pluton.plan9-dns.com
#### unpublished dnscrypt ipv6 stamp
[static.'pluton-ipv6']  
stamp = 'sdns://AQcAAAAAAAAALFsyMDAxOjE5ZjA6OTAwMjpkZTQ6NTQwMDo0ZmY6ZmUwODo3ZGUzXTo4NDQzIFWhVeGvErSH8fH5wsQ8VZcaaapvoSWMgiqrTLUBDZwsJDIuZG5zY3J5cHQtY2VydC5wbHV0b24ucGxhbjktZG5zLmNvbQ'
### Mexico City, Mexico - helios.plan9-dns.com
#### unpublished dnscrypt ipv6 stamp
[static.'helios-ipv6']  
stamp = 'sdns://AQcAAAAAAAAALVsyMDAxOjE5ZjA6YjQwMDoxZDhjOjU0MDA6NGZmOmZlMTE6YjE1YV06ODQ0MyAqY8K6Lfmu06P3KTtzTuwS0L8qHKj_38dyk7bcYKug2yQyLmRuc2NyeXB0LWNlcnQuaGVsaW9zLnBsYW45LWRucy5jb20'

#### protocols
- dnscrypt v2 ipv4/ipv6
- doh (minimum tls v1.3) ipv4/ipv6
- dot (minimum tls v1.3) ipv4/ipv6

#### software
- debian 11 bullseye
- powerDNS-recursor v4.9.2
- dnsdist v1.82
- prometheus v2.37.0

#### logging policy
- powerDNS-recursor - no logs
- dnsdist
  - dnscrypt v2 - no logs
  - doh - no logs
  - dot - no logs 
