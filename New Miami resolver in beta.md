### Logging policy for Miami resolver
- dnscrypt protocol - no logs
- doh-proxy - no logs
- nginx access and error logs used to tune nginx and doh-proxy while in BETA testing.
- all requests to http/1.0 are blocked and banned
- blocklists of abusive ip's and webcrawlers by myip.ms, blocklist.de, firehol_l1, and abuseipdb. 
- fail2ban (ipv4 and ipv6) is banning portscans, and older versions of chrome and firefox that the script kiddies like to use.
- nginx logs are needed for fail2ban, so I'm thinking of 5 minute nginx log rotation and deletion of rotated logs via cronjob.

A new resolver in Miami Florida is in beta testing now, and is offering ipv4, dns-crypt, anonymization, and doh. \
the software used is dnscrypt-server docker, nginx, LE certs via dns api and lexicon, m13253/dns-over-https doh-proxy, prometheus, and fail2ban.

## Miami, Florida
## dnscrypt
## NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.
### ipv4
- [INFO ] Public server address: 104.156.246.39:8443
- [INFO ] Provider public key: a76ff778fc27545b6152afb1589d3f0701faf74f27bdc1bfd06792a481c30907
- [INFO ] Provider name: 2.dnscrypt-cert.doh1.plan9-dns.com
- [INFO ] DNS Stamp: sdns://AQcAAAAAAAAAEzEwNC4xNTYuMjQ2LjM5Ojg0NDMgp2_3ePwnVFthUq-xWJ0_BwH6908nvcG_0GeSpIHDCQciMi5kbnNjcnlwdC1jZXJ0LmRvaDEucGxhbjktZG5zLmNvbQ
- [INFO ] DNS Stamp for Anonymized DNS relaying: sdns://gRMxMDQuMTU2LjI0Ni4zOTo4NDQz

### ipv6 is not going to happen for the unseeable future because of unwanted connections from amazon to unbound that proved impossible to stop... ok, I think the global ipv6 firewall is not working correctly.

## doh-proxy
### Firefox settings:
- network.trr.uri	https://doh1.plan9-dns.com/dns-query
#### other settings I used:
- network.trr.custom_uri	https://doh1.plan9-dns.com/dns-query
- network.trr.bootstrapAddress	104.156.246.39
- network.trr.mode	3
- network.trr.resolvers	[{ "name": "doh1.plan9-dns", "url": "https://doh1.plan9-dns.com/dns-query" }]

### dnscrypt-proxy doh settings:
## NOTE: You must use static configs in dnscrypt-proxy for now, because the server is not published yet.
### ipv4 104.156.246.39 port 443
- [static.'plan9-dns-doh1']
- stamp = 'sdns://AgcAAAAAAAAADjEwNC4xNTYuMjQ2LjM5ID4aGg9sU_PpekktVwhLW5gHBZ7gV6sVBYdv2D_aPbg4EmRvaDEucGxhbjktZG5zLmNvbQovZG5zLXF1ZXJ5'

### dnscrypt-docker init
```sh
docker run --name=dnscrypt-server -p 8443:8443/udp -p 8443:8443/tcp -p 9100:9100/tcp --net=host \
--restart=unless-stopped \
-v /etc/dnscrypt-server/keys:/opt/encrypted-dns/etc/keys \
jedisct1/dnscrypt-server init -A -N doh1.plan9-dns.com -E '104.156.246.39:8443' -M 0.0.0.0:9100
```sh
docker run --name=dnscrypt-server -p 8443:8443/udp -p 8443:8443/tcp -p 9100:9100/tcp --net=host \
> --restart=unless-stopped \
> -v /etc/dnscrypt-server/keys:/opt/encrypted-dns/etc/keys \
> jedisct1/dnscrypt-server init -A -N doh1.plan9-dns.com -E '104.156.246.39:8443' -M 0.0.0.0:9100
WARNING: Published ports are discarded when using host network mode
Provider name: [2.dnscrypt-cert.doh1.plan9-dns.com]
[INFO ] Dropping privileges
[INFO ] State file [/opt/encrypted-dns/etc/keys/state/encrypted-dns.state] found; using existing provider key
[INFO ] Public server address: 104.156.246.39:8443
[INFO ] Provider public key: a76ff778fc27545b6152afb1589d3f0701faf74f27bdc1bfd06792a481c30907
[INFO ] Provider name: 2.dnscrypt-cert.doh1.plan9-dns.com
[INFO ] DNS Stamp: sdns://AQcAAAAAAAAAEzEwNC4xNTYuMjQ2LjM5Ojg0NDMgp2_3ePwnVFthUq-xWJ0_BwH6908nvcG_0GeSpIHDCQciMi5kbnNjcnlwdC1jZXJ0LmRvaDEucGxhbjktZG5zLmNvbQ
[INFO ] DNS Stamp for Anonymized DNS relaying: sdns://gRMxMDQuMTU2LjI0Ni4zOTo4NDQz

-----------------------------------------------------------------------

Congratulations! The container has been properly initialized.
Take a look up above at the way dnscrypt-proxy has to be configured in order
to connect to your resolver. Then, start the container with the default command.

```
