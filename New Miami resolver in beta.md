## Miami, Florida dns resolver in beta testing
- dns-crypt, anonymization, ipv4 (ipv6 coming)
- doh ipv4 and ipv6

### Feb 2nd rebuild
Feb 2nd - dnscrypt working \
Feb 3rd - doh working (accepts tls 1.3 only) \

### Logging policy for Miami resolver
- dnscrypt protocol - no logs
- doh-proxy - no logs
- nginx access and error logs used to tune nginx while in BETA testing. 

the software used is:\
- dnscrypt-server docker
- nginx, LE certs via dns api and lexicon
- m13253/dns-over-https doh-proxy
- prometheus

## Miami, Florida
## dnscrypt ipv4 port:8443
## NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.

``` sh
DNS Stamp: sdns://AQcAAAAAAAAAEzEwNC4xNTYuMjQ2LjM5Ojg0NDMg6vkNrLk0Kx54oL884eTgcR4UwSVLEOhuQDk_Irw7ljEiMi5kbnNjcnlwdC1jZXJ0LmRvaDEucGxhbjktZG5zLmNvbQ

DNS Stamp for Anonymized DNS relaying: sdns://gRMxMDQuMTU2LjI0Ni4zOTo4NDQz
```

## doh-proxy 104.156.246.39 port 443
### Firefox settings:
- network.trr.uri	https://doh1.plan9-dns.com/dns-query
#### other settings I used:
- network.trr.custom_uri	https://doh1.plan9-dns.com/dns-query
- network.trr.bootstrapAddress	104.156.246.39
- network.trr.mode	3
- network.trr.resolvers	[{ "name": "doh1.plan9-dns", "url": "https://doh1.plan9-dns.com/dns-query" }]

### dnscrypt-proxy doh settings:
## NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.

```sh
- stamp = 'sdns://AgcAAAAAAAAADjEwNC4xNTYuMjQ2LjM5ID4aGg9sU_PpekktVwhLW5gHBZ7gV6sVBYdv2D_aPbg4EmRvaDEucGxhbjktZG5zLmNvbQovZG5zLXF1ZXJ5'
```

### dnscrypt-docker init

```sh
root@doh1:~# docker run --name=dnscrypt-server -p 8443:8443/udp -p 8443:8443/tcp -p 9100:9100/tcp --net=host \
> --restart=unless-stopped \
> -v /etc/dnscrypt-server/keys:/opt/encrypted-dns/etc/keys \
> jedisct1/dnscrypt-server init -A -N doh1.plan9-dns.com -E '104.156.246.39:8443' -M 0.0.0.0:9100
Unable to find image 'jedisct1/dnscrypt-server:latest' locally
latest: Pulling from jedisct1/dnscrypt-server
d8b994c44286: Pull complete 
b0773f3f1417: Pull complete 
5b20aefff2dc: Pull complete 
7270e9013d5e: Pull complete 
e5c039e1c63a: Pull complete 
a716ac238d1a: Pull complete 
40e9bd335d99: Pull complete 
e3e12566e37f: Pull complete 
219dcc1b0ba6: Pull complete 
5316963ac997: Pull complete 
2995e86fd245: Pull complete 
04f90a34a8b5: Pull complete 
cf42a04ac254: Pull complete 
2796960e574c: Pull complete 
5134fd4f8e90: Pull complete 
9fcdc1bc49f2: Pull complete 
Digest: sha256:7087b1f82cea809f5ff04e723d2574b685d400eca379a5edab18bae4fd04bbd8
Status: Downloaded newer image for jedisct1/dnscrypt-server:latest
WARNING: Published ports are discarded when using host network mode
Provider name: [2.dnscrypt-cert.doh1.plan9-dns.com]
[INFO ] Dropping privileges
[WARN ] No state file found... creating a new provider key
[INFO ] Public server address: 104.156.246.39:8443
[INFO ] Provider public key: eaf90dacb9342b1e78a0bf3ce1e4e0711e14c1254b10e86e40393f22bc3b9631
[INFO ] Provider name: 2.dnscrypt-cert.doh1.plan9-dns.com
[INFO ] DNS Stamp: sdns://AQcAAAAAAAAAEzEwNC4xNTYuMjQ2LjM5Ojg0NDMg6vkNrLk0Kx54oL884eTgcR4UwSVLEOhuQDk_Irw7ljEiMi5kbnNjcnlwdC1jZXJ0LmRvaDEucGxhbjktZG5zLmNvbQ
[INFO ] DNS Stamp for Anonymized DNS relaying: sdns://gRMxMDQuMTU2LjI0Ni4zOTo4NDQz

-----------------------------------------------------------------------

Congratulations! The container has been properly initialized.
Take a look up above at the way dnscrypt-proxy has to be configured in order
to connect to your resolver. Then, start the container with the default command.
```
