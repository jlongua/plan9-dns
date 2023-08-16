```sh
jason@hped800g4amd:~$ curl -v --doh-url https://helios.plan9-dns.com/dns-query https://www.yandex.com
* Found bundle for host: 0x558a1b46bc90 [serially]
* Server doesn't support multiplex (yet)
*   Trying 216.238.80.219:443...
* Hostname 'helios.plan9-dns.com' was found in DNS cache
*   Trying 216.238.80.219:443...
* Connected to helios.plan9-dns.com (216.238.80.219) port 443 (#1)
* ALPN: offers h2,http/1.1
*  CAfile: /etc/ssl/certs/ca-certificates.crt
*  CApath: /etc/ssl/certs
* Connected to helios.plan9-dns.com (216.238.80.219) port 443 (#2)
* ALPN: offers h2,http/1.1
*  CAfile: /etc/ssl/certs/ca-certificates.crt
*  CApath: /etc/ssl/certs
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN: server accepted h2
* Server certificate:
*  subject: CN=plan9-dns.com
*  start date: Jul  5 00:00:00 2023 GMT
*  expire date: Oct  3 23:59:59 2023 GMT
*  subjectAltName: host "helios.plan9-dns.com" matched cert's "helios.plan9-dns.com"
*  issuer: C=AT; O=ZeroSSL; CN=ZeroSSL ECC Domain Secure Site CA
*  SSL certificate verify ok.
* using HTTP/2
* h2h3 [:method: POST]
* h2h3 [:path: /dns-query]
* h2h3 [:scheme: https]
* h2h3 [:authority: helios.plan9-dns.com]
* h2h3 [accept: */*]
* h2h3 [content-type: application/dns-message]
* h2h3 [content-length: 32]
* Using Stream ID: 1 (easy handle 0x558a1b48d6a0)
> POST /dns-query HTTP/2
Host: helios.plan9-dns.com
accept: */*
content-type: application/dns-message
content-length: 32

* We are completely uploaded and fine
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN: server accepted h2
* Server certificate:
*  subject: CN=plan9-dns.com
*  start date: Jul  5 00:00:00 2023 GMT
*  expire date: Oct  3 23:59:59 2023 GMT
*  subjectAltName: host "helios.plan9-dns.com" matched cert's "helios.plan9-dns.com"
*  issuer: C=AT; O=ZeroSSL; CN=ZeroSSL ECC Domain Secure Site CA
*  SSL certificate verify ok.
* using HTTP/2
* h2h3 [:method: POST]
* h2h3 [:path: /dns-query]
* h2h3 [:scheme: https]
* h2h3 [:authority: helios.plan9-dns.com]
* h2h3 [accept: */*]
* h2h3 [content-type: application/dns-message]
* h2h3 [content-length: 32]
* Using Stream ID: 1 (easy handle 0x558a1b48ebb0)
> POST /dns-query HTTP/2
Host: helios.plan9-dns.com
accept: */*
content-type: application/dns-message
content-length: 32

* We are completely uploaded and fine
* old SSL session ID is stale, removing
< HTTP/2 200 
< server: h2o/dnsdist
< date: Wed, 16 Aug 2023 13:50:54 GMT
< content-type: application/dns-message
< cache-control: max-age=169
< content-length: 110
< 
* Connection #1 to host helios.plan9-dns.com left intact
* a DoH request is completed, 1 to go
* old SSL session ID is stale, removing
* old SSL session ID is stale, removing
< HTTP/2 200 
< server: h2o/dnsdist
< date: Wed, 16 Aug 2023 13:50:54 GMT
< content-type: application/dns-message
< cache-control: max-age=169
< content-length: 74
< 
* Connection #2 to host helios.plan9-dns.com left intact
* a DoH request is completed, 0 to go
* DoH Host name: www.yandex.com
* TTL: 169 seconds
* DoH A: 5.255.255.80
* DoH A: 5.255.255.88
* DoH A: 77.88.55.77
* DoH A: 77.88.55.80
* DoH AAAA: 2a02:06b8:000a:0000:0000:0000:0000:000a
* CNAME: yandex.com
* CNAME: yandex.com
*   Trying 5.255.255.80:443...
* Connected to www.yandex.com (5.255.255.80) port 443 (#0)
* ALPN: offers h2,http/1.1
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
*  CAfile: /etc/ssl/certs/ca-certificates.crt
*  CApath: /etc/ssl/certs
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN: server accepted h2
* Server certificate:
*  subject: C=RU; ST=Moscow; L=Moscow; O=Yandex LLC; CN=*.xn--d1acpjx3f.xn--p1ai
*  start date: Jun 21 13:42:48 2023 GMT
*  expire date: Dec 19 20:59:59 2023 GMT
*  subjectAltName: host "www.yandex.com" matched cert's "*.yandex.com"
*  issuer: C=BE; O=GlobalSign nv-sa; CN=GlobalSign ECC OV SSL CA 2018
*  SSL certificate verify ok.
* using HTTP/2
* h2h3 [:method: GET]
* h2h3 [:path: /]
* h2h3 [:scheme: https]
* h2h3 [:authority: www.yandex.com]
* h2h3 [user-agent: curl/7.88.1]
* h2h3 [accept: */*]
* Using Stream ID: 1 (easy handle 0x558a1b471c70)
> GET / HTTP/2
> Host: www.yandex.com
> user-agent: curl/7.88.1
> accept: */*
> 
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* old SSL session ID is stale, removing
< HTTP/2 302 
< x-yandex-eu-request: 0
< location: https://www.yandex.com/showcaptcha?cc=1&mt=FC0030BD4CA0B591AD6239DFBDCD774E62F984494C82655946E9895F6133B62EE84AA1A0CA93CADD599777878BEB74DAF9C7A72E280ECD3D955D556E56C9928C631DBE50BE7DF431FFEC7FFB53E65390419D1AAEB3658BFF3DBEA1209CBF296783B353DD0ECF9C2785BD75D8&retpath=aHR0cHM6Ly93d3cueWFuZGV4LmNvbS8__dbb8d92ee64562b7582e7bc945a7275d&t=2/1692193855/a4938a973ea85a07170de78e6a80a27f&u=9b8b7f11-16350538-146be137-858e1dae&s=383f1533f629a2905f91f5f10a1d0eb6
< nel: {"report_to": "network-errors", "max_age": 100, "success_fraction": 0.001, "failure_fraction": 0.1}
< x-content-type-options: nosniff
< x-yandex-captcha: captcha
< set-cookie: spravka=dD0xNjYwNjU3ODU1O2k9NDUuNzcuOTkuMTI1O0Q9NDMxQTFGOTJBODQ2RTlCMEFDNzcxMUVEQjE4NEU0OUQ2MkQyRDlEQjBBMDkyQjdDNEFCN0JGOTc2NjFGNzFBQjlFNEIzRjUyNzU4MTt1PTE2NjA2NTc4NTUxMzM1NDU1NDc7aD1iNTU0MTcwZjFiMGI4YTU3YzkwNTFiZDlmOTFhNDI2Yw==; domain=.yandex.com; path=/; expires=Fri, 15 Sep 2023 13:50:55 GMT
< set-cookie: _yasc=nMA+psKnt5q/RS1X80n7t/Byb3QWQFsSbSupCRGyxy/Xwsupjm/+lAcGIMs=; domain=.yandex.com; path=/; expires=Sat, 13 Aug 2033 13:50:55 GMT; secure
< set-cookie: i=sy/fd47lty+zaXBmtOyFVrKMQZjmOWMN7mHMVHuf6h1pvjVK4OYrmHvFAnspv4MHaTZNIR9UEHp6+UaHT2vT+IBB2ew=; Expires=Fri, 15-Aug-2025 13:50:55 GMT; Domain=.yandex.com; Path=/; Secure; HttpOnly
< set-cookie: yandexuid=6404476931692193855; Expires=Fri, 15-Aug-2025 13:50:55 GMT; Domain=.yandex.com; Path=/; Secure
< x-yandex-req-id: 1692193855132539-11662609748040447693-balancer-l7leveler-kubr-yp-vla-9-BAL
< accept-ch: Sec-CH-UA-Platform-Version, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA, Sec-CH-UA-Full-Version-List, Sec-CH-UA-WoW64, Sec-CH-UA-Arch, Sec-CH-UA-Bitness, Sec-CH-UA-Platform, Sec-CH-UA-Full-Version, Viewport-Width, DPR, Device-Memory, RTT, Downlink, ECT
< report-to: { "group": "network-errors", "max_age": 100, "endpoints": [{"url": "https://dr.yandex.net/nel", "priority": 1}, {"url": "https://dr2.yandex.net/nel", "priority": 2}]}
< 
* Connection #0 to host www.yandex.com left intact
```
