Encrypted DNS server draco.plan9dns.com  
TESTING dnsdist v2.0.0 master branch

Software:
 - PowerDNS Authoritative Server v4.8.5
 - PowerDNS Recursor v5.2.2
 - PowerDNS dnsdist v2.0.0 alpha1 

Protocols supported ipv4/ipv6:
 - DNSCrypt on port 8443
 - doh2 and doh3 on port 443
 - https://draco.plan9dns.com/dns-query
 - dot and doq on port 853
 
### This server is live for testing use only.

DNSCrypt stamps
```sh
[static.'draco']
stamp = 'sdns://AQcAAAAAAAAAETE0MC44Mi4xMi44Nzo4NDQzIJDG1BfiqlHGZT5lVycA1FGPIsjyvEjH1l4Fjv3PCAJLIjIuZG5zY3J5cHQtY2VydC5kcmFjby5wbGFuOWRucy5jb20'
[static.'draco-v6']
stamp = 'sdns://AQcAAAAAAAAAKlsyMDAxOjE5ZjA6NTo2ZDEzOjU0MDA6NWZmOmZlM2E6ZTBkMl06ODQ0MyCQxtQX4qpRxmU-ZVcnANRRjyLI8rxIx9ZeBY79zwgCSyIyLmRuc2NyeXB0LWNlcnQuZHJhY28ucGxhbjlkbnMuY29t'
```

DoH stamps
```sh
[static.'draco.doh']
stamp = 'sdns://AgcAAAAAAAAADDE0MC44Mi4xMi44NyCaOjT3J965vKUQA9nOnDn48n3ZxSQpAcK6saROY1oCGRJkcmFjby5wbGFuOWRucy5jb20KL2Rucy1xdWVyeQ'
[static.'draco.doh-v6']
stamp = 'sdns://AgcAAAAAAAAAJVsyMDAxOjE5ZjA6NTo2ZDEzOjU0MDA6NWZmOmZlM2E6ZTBkMl0gmjo09yfeubylEAPZzpw5-PJ92cUkKQHCurGkTmNaAhkSZHJhY28ucGxhbjlkbnMuY29tCi9kbnMtcXVlcnk'
```
