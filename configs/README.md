#### Piscataway, New Jersey, USA - kronos.plan9-dns.com
#### Miami, Florida USA - pluton.plan9-dns.com 
#### Mexico City, Mexico - helios.plan9-dns.com

#### protocols
- dnscrypt v2 ipv4
- doh ipv4/ipv6
- dot ipv4/ipv6

#### software
- debian 11 bullseye
- powerDNS-recursor v4.9.1
- dnsdist v1.80
- prometheus v2.37.0

#### logging policy
- powerDNS-recursor - no logs
- dnsdist
  - dnscrypt v2 - no logs
  - doh - no logs
  - dot - no logs 
