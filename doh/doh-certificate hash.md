https://www.ssl.com/guide/pem-der-crt-and-cer-x-509-encodings-and-conversions \
https://gist.github.com/jedisct1/d6cb41742a1ceb54d48cc286f3d5c5fa

##### copy ca.cert to temporary directory
```sh
cp ~/.acme.sh/plan9-dns.com_ecc/ca.cer /tmp
```
##### change to /tmp directory
```sh
cd /tmp
```
##### convert cert from pem to der
```sh
openssl x509 -outform der -in ca.cer -out cert.der
```
##### run tls-cert-hash.go
```sh
go run tls-cert-hash.go 
[CN=ZeroSSL ECC Domain Secure Site CA,O=ZeroSSL,C=AT]: 9a3a34f727deb9bca51003d9ce9c39f8f27dd9c5242901c2bab1a44e635a0219
```


##### check go-lang setup
```sh
go version
-bash: go: command not found
export PATH=$PATH:/usr/local/go/bin
go version
go version go1.18.2 linux/amd64
```
##### tls-cert-hash.go program
```sh
cat tls-cert-hash.go
package main

import (
	"crypto/sha256"
	"crypto/x509"
	"fmt"
	"io/ioutil"
)

func main() {
	dat, err := ioutil.ReadFile("/tmp/cert.der")
	if err != nil {
		panic(err)
	}
	certs, err := x509.ParseCertificates(dat)
	if err != nil {
		panic(err)
	}
	for _, cert := range certs {
		h := sha256.Sum256(cert.RawTBSCertificate)
		fmt.Printf("[%v]: %v\n", cert.Subject, fmt.Sprintf("%x", h))
	}
}
```
