#### drwetter's cli tool to test ssl certs

- [testssl github](https://github.com/drwetter/testssl.sh)
- [testing TLS/SSL encryption](https://testssl.sh/)

usage:

```sh
./testssl.sh <domain>
```

#### print pin
```sh
gnutls-cli --print-cert -p 853 helios.plan9-dns.com | grep "pin-sha256" | head -1
```

#### check expiration date

- [cli](https://www.cyberciti.biz/faq/find-check-tls-ssl-certificate-expiry-date-from-linux-unix/)

```sh
openssl x509 -enddate -noout -in /etc/zerossl/plan9-dns.com_ecc/fullchain.pem
```
```sh
openssl s_client -servername plan9-dns.com -connect plan9-dns.com:443 | openssl x509 -noout -dates
```

#### ssl labs
```sh
https://www.ssllabs.com/ssltest/analyze.html?d=helios.plan9-dns.com
```

#### view cert info
```sh
openssl s_client -showcerts -connect helios.plan9-dns.com:443
```
```sh
openssl s_client -connect helios.plan9-dns.com:443
```
