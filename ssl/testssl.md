#### drwetter's cli tool to test ssl certs

- [testssl](https://github.com/drwetter/testssl.sh)

usage:

```sh
./testssl.sh <domain>
```

#### print pin
```sh
gnutls-cli --print-cert -p 853 draco.plan9-ns2.com | grep "pin-sha256" | head -1
```

#### check expiration date

- [cli](https://www.cyberciti.biz/faq/find-check-tls-ssl-certificate-expiry-date-from-linux-unix/)

```sh
openssl x509 -enddate -noout -in /etc/letsencrypt/plan9-ns2.com_ecc/fullchain.pem
```

#### ssl labs
```sh
https://www.ssllabs.com/ssltest/analyze.html?d=draco.plan9-ns2.com
```

#### view cert info
```sh
openssl s_client -showcerts -connect draco.plan9-ns2.com:443
```
```sh
openssl s_client -connect draco.plan9-ns2.com:443
```
