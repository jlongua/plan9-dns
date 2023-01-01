cat sshpwauth.sh 
```sh
#!/bin/bash

#####
# https://dataplane.org/signals/sshpwauth.txt
#
# ipset create sshblock hash:net family inet hashsize 327680 maxelem 655360
# iptables -I INPUT 1 -m set --match-set sshblock src -j DROP
#
# 0 23 * * * /root/scripts/sshblock.sh 2>&1  | logger -t sshBlock
#####

# work in subdirectory tmp
cd /root/blocklists/tmp

# need to delete sshpwauth.txt otherwise is auto-incremented eg. .txt.1, .txt.2...
rm /root/blocklists/tmp/sshpwauth.txt

# dl sshpwauth.txt from dataplane.org
wget https://dataplane.org/signals/sshpwauth.txt

# pull out ipv4 addresses
grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' /root/blocklists/tmp/sshpwauth.txt > /root/blocklists/tmp/sshpwauth.ips

ipset flush sshblock

for ip in $(cat /root/blocklists/tmp/sshpwauth.ips); do ipset -A -exist sshblock $ip;done
```
