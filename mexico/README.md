## helios.plan9-dns.com
### Mexico City, Mexico

#### protocols
- dnscrypt v2 ipv4
- doh ipv4/ipv6
- dot ipv4/ipv6

#### software
- debian 11 bullseye
- powerDNS-recursor v4.7.1
- dnsdist v1.72
- prometheus 

#### logging policy
- powerDNS-recursor - no logs
- dnsdist
  - dnscrypt v2 - no logs
  - doh - no logs
  - dot - no logs 
