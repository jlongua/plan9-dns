```sh
$ curl -v --doh-url https://kronos.plan9-dns.com/dns-query https://www.google.com
* Expire in 0 ms for 6 (transfer 0x5633e83780f0)
* Expire in 0 ms for 6 (transfer 0x5633e837b250)
* Expire in 0 ms for 6 (transfer 0x5633e839fce0)
* Expire in 300000 ms for 8 (transfer 0x5633e837b250)
* Expire in 1 ms for 1 (transfer 0x5633e837b250)
* Expire in 300000 ms for 8 (transfer 0x5633e839fce0)
* Found bundle for host kronos.plan9-dns.com: 0x5633e8376f20 [serially]
* Server doesn't support multi-use (yet)
* Expire in 1 ms for 1 (transfer 0x5633e839fce0)
* Expire in 0 ms for 1 (transfer 0x5633e837b250)

...yada, yada, yada

* Expire in 7 ms for 1 (transfer 0x5633e839fce0)
* Expire in 9 ms for 1 (transfer 0x5633e837b250)
*   Trying 207.246.87.96...
* TCP_NODELAY set
* Expire in 149986 ms for 3 (transfer 0x5633e837b250)
* Expire in 200 ms for 4 (transfer 0x5633e837b250)
* Hostname 'kronos.plan9-dns.com' was found in DNS cache
* Expire in 9 ms for 1 (transfer 0x5633e839fce0)
*   Trying 207.246.87.96...
* TCP_NODELAY set
* Expire in 149986 ms for 3 (transfer 0x5633e839fce0)
* Expire in 200 ms for 4 (transfer 0x5633e839fce0)
* Connected to kronos.plan9-dns.com (207.246.87.96) port 443 (#1)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* Connected to kronos.plan9-dns.com (207.246.87.96) port 443 (#2)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=plan9-dns.com
*  start date: May 23 00:00:00 2022 GMT
*  expire date: Aug 21 23:59:59 2022 GMT
*  subjectAltName: host "kronos.plan9-dns.com" matched cert's "kronos.plan9-dns.com"
*  issuer: C=AT; O=ZeroSSL; CN=ZeroSSL ECC Domain Secure Site CA
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x5633e837b250)
> POST /dns-query HTTP/2
Host: kronos.plan9-dns.com
Accept: */*
Content-Type: application/dns-message
Content-Length: 32

* We are completely uploaded and fine
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=plan9-dns.com
*  start date: May 23 00:00:00 2022 GMT
*  expire date: Aug 21 23:59:59 2022 GMT
*  subjectAltName: host "kronos.plan9-dns.com" matched cert's "kronos.plan9-dns.com"
*  issuer: C=AT; O=ZeroSSL; CN=ZeroSSL ECC Domain Secure Site CA
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x5633e839fce0)
> POST /dns-query HTTP/2
Host: kronos.plan9-dns.com
Accept: */*
Content-Type: application/dns-message
Content-Length: 32

* We are completely uploaded and fine
* Connection state changed (MAX_CONCURRENT_STREAMS == 250)!
* Connection state changed (MAX_CONCURRENT_STREAMS == 250)!
< HTTP/2 200 
< access-control-allow-headers: Content-Type
< access-control-allow-methods: GET, HEAD, OPTIONS, POST
< access-control-allow-origin: *
< access-control-max-age: 3600
< cache-control: private, max-age=300
< content-type: application/dns-message
< date: Sun, 03 Jul 2022 00:18:58 GMT
< expires: Sun, 03 Jul 2022 00:23:58 GMT
< last-modified: Sun, 03 Jul 2022 00:18:58 GMT
< server: DNS-over-HTTPS/2.3.2 (+https://github.com/m13253/dns-over-https)
< vary: Accept
< x-powered-by: DNS-over-HTTPS/2.3.2 (+https://github.com/m13253/dns-over-https)
< content-length: 73
< 
* Connection #1 to host kronos.plan9-dns.com left intact
* a DOH request is completed, 1 to go
< HTTP/2 200 
< access-control-allow-headers: Content-Type
< access-control-allow-methods: GET, HEAD, OPTIONS, POST
< access-control-allow-origin: *
< access-control-max-age: 3600
< cache-control: private, max-age=300
< content-type: application/dns-message
< date: Sun, 03 Jul 2022 00:18:58 GMT
< expires: Sun, 03 Jul 2022 00:23:58 GMT
< last-modified: Sun, 03 Jul 2022 00:18:58 GMT
< server: DNS-over-HTTPS/2.3.2 (+https://github.com/m13253/dns-over-https)
< vary: Accept
< x-powered-by: DNS-over-HTTPS/2.3.2 (+https://github.com/m13253/dns-over-https)
< content-length: 85
< 
* Could not resolve host: kronos.plan9-dns.com
* Closing connection 2
* a DOH request is completed, 0 to go
* Expire in 0 ms for 6 (transfer 0x5633e83780f0)
* DOH Host name: www.google.com
* TTL: 300 seconds
* DOH A: 142.250.80.100
* DOH AAAA: 2607:f8b0:4006:080d:0000:0000:0000:2004
*   Trying 142.250.80.100...
* TCP_NODELAY set
* Expire in 149935 ms for 3 (transfer 0x5633e83780f0)
* Expire in 200 ms for 4 (transfer 0x5633e83780f0)
* Connected to www.google.com (142.250.80.100) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=www.google.com
*  start date: Jun  6 09:40:00 2022 GMT
*  expire date: Aug 29 09:39:59 2022 GMT
*  subjectAltName: host "www.google.com" matched cert's "www.google.com"
*  issuer: C=US; O=Google Trust Services LLC; CN=GTS CA 1C3
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x5633e83780f0)
> GET / HTTP/2
> Host: www.google.com
> User-Agent: curl/7.64.0
> Accept: */*
> 
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* old SSL session ID is stale, removing
* Connection state changed (MAX_CONCURRENT_STREAMS == 100)!
< HTTP/2 200 
< date: Sun, 03 Jul 2022 00:18:59 GMT
< expires: -1
< cache-control: private, max-age=0
< content-type: text/html; charset=ISO-8859-1
< p3p: CP="This is not a P3P policy! See g.co/p3phelp for more info."
< server: gws
< x-xss-protection: 0
< x-frame-options: SAMEORIGIN
< set-cookie: 1P_JAR=2022-07-03-00; expires=Tue, 02-Aug-2022 00:18:59 GMT; path=/; domain=.google.com; Secure
< set-cookie: AEC=AakniGPQ5VLyPBFmuZbkL0PYIthdtg3BVbJJ0J9EnfPfci8buQhsB0Jb1JA; expires=Fri, 30-Dec-2022 00:18:59 GMT; path=/; domain=.google.com; Secure; HttpOnly; SameSite=lax
< set-cookie: NID=511=SRJwNQmzDvAJfEBAguq9XnaqYbQWqIpiOlyxZARqhjatEKVBn0cWcLRtocMtVC9euFiIX8sOqwJjcc3uj-Wgc_CLF09ZcnJ5Na9J4ysKlsLG3Tr55N9SHwXQ0BNsxtjlNqjlpO5kNppou7OS1Jzz6SQmgXj6q1hYAuUbbXEIcD0; expires=Mon, 02-Jan-2023 00:18:59 GMT; path=/; domain=.google.com; HttpOnly
< alt-svc: h3=":443"; ma=2592000,h3-29=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"
< accept-ranges: none
< vary: Accept-Encoding

...yada, yada, yada

Connection #0 to host www.google.com left intact
```

