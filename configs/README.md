### Piscataway, New Jersey, USA - kronos.plan9-dns.com

### Miami, Florida USA - pluton.plan9-dns.com

### Mexico City, Mexico - helios.plan9-dns.com

#### protocols
- DNSCrypt v2 ipv4/ipv6, port 8443
- DoH (minimum tls v1.3) ipv4/ipv6, port 443
- DoH3 HTTP/3 via the Alt-Svc header, ipv4/ipv6, port 443
- DoT (minimum tls v1.3) ipv4/ipv6, port 853
- DoQ ipv4/ipv6, port 853

#### software
- debian 11 bullseye
- powerDNS-recursor v5.2.5
- dnsdist v2.0.0
- prometheus v2.37.0

#### logging policy
- powerDNS-recursor - no logs
- dnsdist
  - DNSCrypt v2 - no logs
  - DoH/DoH3 - no logs
  - DoT/DoQ - no logs
