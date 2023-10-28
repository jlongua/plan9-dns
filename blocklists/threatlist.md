cat /root/blocklists/threatlist.sh
```sh
#!/bin/bash

#####
# https://virtualfabric.com/services/free-online-security/free-online-security-downloads/
#
# https://dl.threat-list.com/ips/ips.txt
# https://nocdn.threat-list.com/ips/ips.txt
#
# ipset create threatblock hash:net family inet hashsize 327680 maxelem 655360
# iptables -I INPUT 1 -m set --match-set threatblock src -j DROP
#
# ipset create threatblock.ipv6 hash:net family inet6 hashsize 327680 maxelem 655360
# ip6tables -I INPUT 1 -m set --match-set threatblock.ipv6 src -j DROP
#
# 0 22 * * * /root/scripts/threatlist.sh 2>&1  | logger -t threatBlock
#####

# work in subdirectory tmp
cd /root/blocklists/tmp

# dl threat list
wget -O threatlist.raw https://dl.threat-list.com/ips/ips.txt

# pull out ipv4 addresses
grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' /root/blocklists/tmp/threatlist.raw > /root/blocklists/tmp/threat.ips

# pull out ipv6 addresses
grep -Eo '(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))' /root/blocklists/tmp/threatlist.raw > /root/blocklists/tmp/threat.ips.v6

ipset flush threatblock
ipset flush threatblock.ipv6

for ip in $(cat /root/blocklists/tmp/threat.ips); do ipset -A -exist threatblock $ip;done
for ip in $(cat /root/blocklists/tmp/threat.ips.v6); do ipset -A -exist threatblock.ipv6 $ip;done
```
