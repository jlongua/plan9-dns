## helios.plan9-dns.com
### Mexico City, Mexico

#### protocols
- dnscrypt v2 ipv4/ipv6
- doh ipv4/ipv6
- dot ipv4/ipv6

#### software
- debian 11 bullseye
- knot-resolver v5.5.1
- dnsdist v1.72
- encrypted-dns-server v0.9.6
- node-exporter, prometheus

#### logging policy
- knot-resolver - no logs
- dnsdist
  - doh - no logs
  - dot - no logs
- encrypted-dns-server 
  - no logs
