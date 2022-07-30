```sh
jason@dq77mk:~$ curl -v --doh-url https://helios.plan9-dns.com/dns-query https://www.yandex.com
```
* Expire in 0 ms for 6 (transfer 0x55583f3f50f0)
* Expire in 0 ms for 6 (transfer 0x55583f3f8250)
* Expire in 0 ms for 6 (transfer 0x55583f41cce0)
* Expire in 300000 ms for 8 (transfer 0x55583f3f8250)
* Expire in 1 ms for 1 (transfer 0x55583f3f8250)
* Expire in 300000 ms for 8 (transfer 0x55583f41cce0)
* Found bundle for host helios.plan9-dns.com: 0x55583f3f3f20 [serially]
* Server doesn't support multi-use (yet)
* Expire in 1 ms for 1 (transfer 0x55583f41cce0)
* Expire in 0 ms for 1 (transfer 0x55583f3f8250)

...yada, yada, yada

* Expire in 0 ms for 1 (transfer 0x55583f41cce0)
* Expire in 0 ms for 1 (transfer 0x55583f3f8250)
*   Trying 216.238.80.219...
* TCP_NODELAY set
* Expire in 149999 ms for 3 (transfer 0x55583f3f8250)
* Expire in 200 ms for 4 (transfer 0x55583f3f8250)
* Hostname 'helios.plan9-dns.com' was found in DNS cache
* Expire in 0 ms for 1 (transfer 0x55583f41cce0)
*   Trying 216.238.80.219...
* TCP_NODELAY set
* Expire in 149999 ms for 3 (transfer 0x55583f41cce0)
* Expire in 200 ms for 4 (transfer 0x55583f41cce0)
* Connected to helios.plan9-dns.com (216.238.80.219) port 443 (#1)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* Connected to helios.plan9-dns.com (216.238.80.219) port 443 (#2)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=plan9-dns.com
*  start date: May 23 00:00:00 2022 GMT
*  expire date: Aug 21 23:59:59 2022 GMT
*  subjectAltName: host "helios.plan9-dns.com" matched cert's "helios.plan9-dns.com"
*  issuer: C=AT; O=ZeroSSL; CN=ZeroSSL ECC Domain Secure Site CA
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55583f3f8250)
> POST /dns-query HTTP/2
Host: helios.plan9-dns.com
Accept: */*
Content-Type: application/dns-message
Content-Length: 32

* We are completely uploaded and fine
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=plan9-dns.com
*  start date: May 23 00:00:00 2022 GMT
*  expire date: Aug 21 23:59:59 2022 GMT
*  subjectAltName: host "helios.plan9-dns.com" matched cert's "helios.plan9-dns.com"
*  issuer: C=AT; O=ZeroSSL; CN=ZeroSSL ECC Domain Secure Site CA
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55583f41cce0)
> POST /dns-query HTTP/2
Host: helios.plan9-dns.com
Accept: */*
Content-Type: application/dns-message
Content-Length: 32

* We are completely uploaded and fine
* old SSL session ID is stale, removing
* Connection state changed (MAX_CONCURRENT_STREAMS == 100)!
< HTTP/2 200 
< server: h2o/dnsdist
< date: Sat, 16 Jul 2022 04:38:28 GMT
< content-type: application/dns-message
< cache-control: max-age=590
< content-length: 110
< 
* Connection #1 to host helios.plan9-dns.com left intact
* a DOH request is completed, 1 to go
* old SSL session ID is stale, removing
* Connection state changed (MAX_CONCURRENT_STREAMS == 100)!
< HTTP/2 200 
< server: h2o/dnsdist
< date: Sat, 16 Jul 2022 04:38:28 GMT
< content-type: application/dns-message
< cache-control: max-age=590
< content-length: 74
< 
* Could not resolve host: helios.plan9-dns.com
* Closing connection 2
* a DOH request is completed, 0 to go
* Expire in 0 ms for 6 (transfer 0x55583f3f50f0)
* DOH Host name: www.yandex.com
* TTL: 590 seconds
* DOH A: 77.88.55.77
* DOH A: 77.88.55.80
* DOH A: 5.255.255.80
* DOH A: 5.255.255.88
* DOH AAAA: 2a02:06b8:000a:0000:0000:0000:0000:000a
* CNAME: yandex.com
* CNAME: yandex.com
*   Trying 77.88.55.77...
* TCP_NODELAY set
* Expire in 149878 ms for 3 (transfer 0x55583f3f50f0)
* Expire in 200 ms for 4 (transfer 0x55583f3f50f0)
* Connected to www.yandex.com (77.88.55.77) port 443 (#0)
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
*  subject: C=RU; ST=Moscow; L=Moscow; OU=IT; O=Yandex LLC; CN=*.xn--d1acpjx3f.xn--p1ai
*  start date: Mar  4 18:02:35 2022 GMT
*  expire date: Sep  1 20:59:59 2022 GMT
*  subjectAltName: host "www.yandex.com" matched cert's "*.yandex.com"
*  issuer: C=BE; O=GlobalSign nv-sa; CN=GlobalSign ECC OV SSL CA 2018
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55583f3f50f0)
> GET / HTTP/2
> Host: www.yandex.com
> User-Agent: curl/7.64.0
> Accept: */*
> 
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* old SSL session ID is stale, removing
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
< HTTP/2 302 
< location: https://www.yandex.com/showcaptcha?cc=1&retpath=aHR0cHM6Ly93d3cueWFuZGV4LmNvbS8__3700a2f73d05713cc10244cfb4fa9fda&t=2/1657946308/453621af2298def6b9415c60a110125e&u=392679d5-b551d25a-b4e80f0a-848c1f46&s=e2854824e8ea4b9c412f50990c5b5d5f
< report-to: { "group": "network-errors", "max_age": 86400, "endpoints": [ { "url": "https://dr.yandex.net/nel"}]}
< x-yandex-eu-request: 0
< nel: {"report_to": "network-errors", "max_age": 86400, "success_fraction": 0.001, "failure_fraction": 0.1}
< x-content-type-options: nosniff
< set-cookie: spravka=dD0xNjI2NDEwMzA4O2k9NDUuNzcuOTkuMTI1O0Q9ODZEOTAyOUU5QzMwRThCOENEMDZFQUY4OTMzODhBRjA4MzBDQzI0RkNCRDZFRTkxN0UzNkJBNDE1OEQ5M0YzQ0NDMzY3Q0UzO3U9MTYyNjQxMDMwODY2Nzc3MzAwMDtoPWUwOWQxMjhkODc5NDQ2NzI1MzlkMzUwY2U2M2QzNzEx; domain=.yandex.com; path=/; expires=Mon, 15-Aug-2022 04:38:28 GMT
< set-cookie: i=RJC/i7tcqQJPaOw3H3MvzqfY5T7MrGC0J1vuXVWNPJKYgOuRhGrgrK6oM1ozI2OgWeXje8HDRbUyHx/tsL0CmXdBRNk=; Expires=Mon, 15-Jul-2024 04:38:28 GMT; Domain=.yandex.com; Path=/; Secure; HttpOnly
< 
* Connection #0 to host www.yandex.com left intact
