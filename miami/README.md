## pluton.plan9-dns.com 
### Miami, Florida

#### protocols
- dnscrypt v2 ipv4
- doh ipv4/ipv6
- dot ipv4/ipv6

#### logging policy
- dnsdist
  - dcscrypt - no logs
  - doh - no logs
  - dot - no logs
- pdns-recursor - no logs

#### software
- debian bullseye
- dnsdist v1.72
- pdns-recursor v4.71
- node-exporter, prometheus
