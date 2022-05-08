## Plan9-dns is pleased to provide unfiltered dns for all


#### except datacenters blocked due to consistent attacks on servers

digitalocean AS1406, AS205301\
psinet AS3291, AS16463\
censys AS133413, AS398324, AS398705, AS398722\
ponynet AS53667

``` sh
https://asn.ipinfo.app/search
```

#### parsing active connections for abuse

```sh
netstat -tulpna | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | cut -d '.' -f 1-4 | sort | uniq -c | sort
ss -at '( dport = :443 or sport = :443 )' | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | cut -d '.' -f 1-3 | sort | uniq -c | sort
ss -at '( dport = :853 or sport = :853 )' | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | cut -d '.' -f 1-3 | sort | uniq -c | sort
ss -at '( dport = :8443 or sport = :8443 )' | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | cut -d '.' -f 1-3 | sort | uniq -c | sort
```
