Update the image
```
# docker pull jedisct1/dnscrypt-server
```
Verify that the directory containing the keys actually has the keys (a state directory):
```
# ls -l /etc/dnscrypt-server/keys
```
Nothing here? Maybe you didn't use the -v option to map container files to a local directory when creating the container.
In that case, copy the data directly from the container:
```
# docker cp dnscrypt-server:/opt/encrypted-dns/etc/keys ~/keys
```
Stop the existing container:
```
# docker stop dnscrypt-server
# docker ps # Check that it's not running
```
Rename the existing container:
```
# docker rename dnscrypt-server dnscrypt-server-old
```
Use the init command again and start the new container:
```
# docker run --name=dnscrypt-server -p 443:443/udp -p 443:443/tcp -p 9100:9100/tcp --net=host \
--restart=unless-stopped \
-v /etc/dnscrypt-server/keys:/opt/encrypted-dns/etc/keys \
jedisct1/dnscrypt-server init -A -N plan9-dns.com -E '173.199.126.35:443' -M 0.0.0.0:9100
```
Check that it's running
```
# docker ps
```
Delete old container:
```
# docker rm dnscrypt-server-old
```
Done!