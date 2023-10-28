cat ipverse-rir-ip.sh 
```sh
#!/bin/bash
#####
#
# https://github.com/ipverse/rir-ip
# block countries with ipset
# ipset create ipverse.block hash:net family inet hashsize 327680 maxelem 655360
# iptables -A INPUT -m set --match-set ipverse.block src -j DROP
#
# ipset create ipverse.block.ipv6 hash:net family inet6 hashsize 327680 maxelem 655360
# ip6tables -A INPUT -m set --match-set ipverse.block.ipv6 src -j DROP
#
#####

work in tmp directory
cd /root/blocklists/tmp

# block countryX
#
# wget ipverse selected country data
for IP in $(/usr/bin/wget -w 1 -O - https://raw.githubusercontent.com/ipverse/rir-ip/master/country/{ir,sc}/aggregated.json)
do
# save raw country data to file
echo $IP >> ipverse.json
done

# pull out ipv4 and save to file
grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})/[0-9]{1,2}' ipverse.json > ipverse.ipv4

# pull out ipv6 and save to file
grep -Eo '(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))/[0-9]{1,2}' ipverse.json > ipverse.ipv6

# flush ipset
ipset flush ipverse.block
ipset flus ipverse.block.ipv6

# whitelist ip's
ipset add ipverse.block <ip> nomatch
# acme.sh zerossl
ipset add ipverse.block 91.199.212.0/24 nomatch

# add ipverse country cidr's to ipset
for ip in $(cat ipverse.ipv4); do ipset -A -exist ipverse.block $ip;done
for ip in $(cat ipverse.ipv6); do ipset -A -exist ipverse.block.ipv6 $ip;done
```
