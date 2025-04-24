Initial testing of dnsdist v2.0.0 alpha1 has cert rotation errors with dnscrypt running 2 binds, ipv4 and ipv6.  
This gave me a reason to try jedisct1's encrypted-dns dnscrypt server, which also offers anonymization.  

Ok, so the team at Powerdns has reproduced the cert rotation error and the fix is in the works.  
I really like the anonymization feature of jedisct1's encrypted-dns dnscrypt server,  
and will look into running a anon-relay only, on a different port.

Software:
 - PowerDNS Authoritative Server v4.8.5
 - PowerDNS Recursor v5.2.2
 - PowerDNS dnsdist v2.0.0 alpha1
 - jedisct1 encrypted-dns-server 0.9.16 

Protocols supported ipv4/ipv6:
 - doh2 and doh3 on port 443
 - https://draco.plan9dns.com/dns-query
 - dot and doq on port 853
 - DNSCrypt on port 8443
 - DNSCrypt anonymization

### This server is live now and needs testers.

```sh
Public server address: 140.82.12.87:8443
Provider public key: a796946ae8d50a005677a41de95f94cde4a88b0850de60f46b7be6079d03822d
Provider name: 2.dnscrypt-cert.draco.plan9dns.com
DNS Stamp: sdns://AQcAAAAAAAAAETE0MC44Mi4xMi44Nzo4NDQzIKeWlGro1QoAVnekHelflM3kqIsIUN5g9Gt75gedA4ItIjIuZG5zY3J5cHQtY2VydC5kcmFjby5wbGFuOWRucy5jb20
DNS Stamp for Anonymized DNS relaying: sdns://gRExNDAuODIuMTIuODc6ODQ0Mw
```

```sh
Public server address: [2001:19f0:5:6d13:5400:5ff:fe3a:e0d2]:8443
Provider public key: a796946ae8d50a005677a41de95f94cde4a88b0850de60f46b7be6079d03822d
Provider name: 2.dnscrypt-cert.draco.plan9dns.com
DNS Stamp: sdns://AQcAAAAAAAAAKlsyMDAxOjE5ZjA6NTo2ZDEzOjU0MDA6NWZmOmZlM2E6ZTBkMl06ODQ0MyCnlpRq6NUKAFZ3pB3pX5TN5KiLCFDeYPRre-YHnQOCLSIyLmRuc2NyeXB0LWNlcnQuZHJhY28ucGxhbjlkbnMuY29t
DNS Stamp for Anonymized DNS relaying: sdns://gSpbMjAwMToxOWYwOjU6NmQxMzo1NDAwOjVmZjpmZTNhOmUwZDJdOjg0NDM
```
