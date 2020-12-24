A new resolver in Miami Florida is in beta testing now, and is offering ipv4/ipv6, dns-crypt, anonymization, and doh. \
the software used is dnscryp-server docker, nginx, m13253/dns-over-https doh-proxy. \
## Miami, Florida
## dnscrypt
## NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet. \
### ipv4
- [INFO ] Public server address: 104.156.246.39:8443 \
- [INFO ] Provider public key: a76ff778fc27545b6152afb1589d3f0701faf74f27bdc1bfd06792a481c30907 \
- [INFO ] Provider name: 2.dnscrypt-cert.doh1.plan9-dns.com \
- [INFO ] DNS Stamp: sdns://AQcAAAAAAAAAEzEwNC4xNTYuMjQ2LjM5Ojg0NDMgp2_3ePwnVFthUq-xWJ0_BwH6908nvcG_0GeSpIHDCQciMi5kbnNjcnlwdC1jZXJ0LmRvaDEucGxhbjktZG5zLmNvbQ \
- [INFO ] DNS Stamp for Anonymized DNS relaying: sdns://gRMxMDQuMTU2LjI0Ni4zOTo4NDQz \
### ipv6
- [INFO ] Public server address: [2001:19f0:9002:1ecb:5400::1]:8443 \
- [INFO ] Provider public key: a76ff778fc27545b6152afb1589d3f0701faf74f27bdc1bfd06792a481c30907 \
- [INFO ] Provider name: 2.dnscrypt-cert.doh1.plan9-dns.com \
- [INFO ] DNS Stamp: sdns://AQcAAAAAAAAAIlsyMDAxOjE5ZjA6OTAwMjoxZWNiOjU0MDA6OjFdOjg0NDMgp2_3ePwnVFthUq-xWJ0_BwH6908nvcG_0GeSpIHDCQciMi5kbnNjcnlwdC1jZXJ0LmRvaDEucGxhbjktZG5zLmNvbQ \
- [INFO ] DNS Stamp for Anonymized DNS relaying: sdns://gSJbMjAwMToxOWYwOjkwMDI6MWVjYjo1NDAwOjoxXTo4NDQz \

## doh-proxy
### Firefox settings:
- network.trr.uri	https://doh1.plan9-dns.com/dns-query \
other settings I used: \
- network.trr.custom_uri	https://doh1.plan9-dns.com/dns-query \
- network.trr.bootstrapAddress	104.156.246.39 \
- network.trr.mode	3 \
- network.trr.resolvers	[{ "name": "doh1.plan9-dns", "url": "https://doh1.plan9-dns.com/dns-query" }] \

### dnscrypt-proxy settings:
## NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet. \
### ipv4 104.156.246.39 port 443 \
- [static.'plan9-dns-doh1'] \
- stamp = 'sdns://AgcAAAAAAAAADjEwNC4xNTYuMjQ2LjM5ID4aGg9sU_PpekktVwhLW5gHBZ7gV6sVBYdv2D_aPbg4EmRvaDEucGxhbjktZG5zLmNvbQovZG5zLXF1ZXJ5' \
### ipv6 2001:19f0:9002:1ecb:5400::1 port 443 \
- [static.'plan9-dns-doh1-ipv6'] \
- sdns://AgcAAAAAAAAAHVsyMDAxOjE5ZjA6OTAwMjoxZWNiOjU0MDA6OjFdID4aGg9sU_PpekktVwhLW5gHBZ7gV6sVBYdv2D_aPbg4EmRvaDEucGxhbjktZG5zLmNvbQovZG5zLXF1ZXJ5 \
