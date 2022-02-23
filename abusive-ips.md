#### datacenters blocked due to consistent attacks on servers

``` sh
https://asn.ipinfo.app/search
```

digitalocean \
linode

#### parsing active connections for abuse

```sh
netstat -tulpna | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | cut -d '.' -f 1-4 | sort | uniq -c | sort
ss -at '( dport = :443 or sport = :443 )' | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | cut -d '.' -f 1-3 | sort | uniq -c | sort
ss -at '( dport = :853 or sport = :853 )' | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | cut -d '.' -f 1-3 | sort | uniq -c | sort
ss -at '( dport = :8443 or sport = :8443 )' | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | cut -d '.' -f 1-3 | sort | uniq -c | sort
```
