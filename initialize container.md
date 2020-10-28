pull dnscrypt-server image and initialize container

```
docker run --name=dnscrypt-server -p 443:443/udp -p 443:443/tcp -p 9100:9100/tcp --net=host \
--restart=unless-stopped \
-v /etc/dnscrypt-server/keys:/opt/encrypted-dns/etc/keys \
jedisct1/dnscrypt-server init -A -N plan9-dns -E '173.199.126.35:443' -M 0.0.0.0:9100
```
note: --net=host is needed to connect prometheus and docker\
port 3000 is used by grafana
```
root@dnscrypt:~/dnscrypt-server# docker run --name=dnscrypt-server -p 443:443/udp -p 443:443/tcp -p 9100:9100/tcp --net=host \
> --restart=unless-stopped \
> -v /etc/dnscrypt-server/keys:/opt/encrypted-dns/etc/keys \
> jedisct1/dnscrypt-server init -A -N plan9-dns -E '173.199.126.35:443' -M 0.0.0.0:9100
WARNING: Published ports are discarded when using host network mode
Provider name: [2.dnscrypt-cert.plan9-dns]
[INFO ] Dropping privileges
[INFO ] State file [/opt/encrypted-dns/etc/keys/state/encrypted-dns.state] found; using existing provider key
[INFO ] Public server address: 173.199.126.35:443
[INFO ] Provider public key: 92f01f7cfcf86e930f2124eb25cc986c6eb2cee719f167907aed9b854e49cf52
[INFO ] Provider name: 2.dnscrypt-cert.plan9-dns
[INFO ] DNS Stamp: sdns://AQcAAAAAAAAAEjE3My4xOTkuMTI2LjM1OjQ0MyCS8B98_Phukw8hJOslzJhsbrLO5xnxZ5B67ZuFTknPUhkyLmRuc2NyeXB0LWNlcnQucGxhbjktZG5z
[INFO ] DNS Stamp for Anonymized DNS relaying: sdns://gRIxNzMuMTk5LjEyNi4zNTo0NDM

-----------------------------------------------------------------------

Congratulations! The container has been properly initialized.
Take a look up above at the way dnscrypt-proxy has to be configured in order
to connect to your resolver. Then, start the container with the default command.
```
start the server
```sh
docker start dnscrypt-server
```
