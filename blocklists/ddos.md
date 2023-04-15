Script to block ips creating hundreds of connections causing netfilter connect track table to fill up.  
Crontab runs script every 20 minutes.  
Uses ipset timeout to block offenders for 4 hours.  

cat ~/scripts/ddos.sh 
``` sh
#!/bin/bash
#
# ipset create ddosBlock hash:net family inet hashsize 327680 maxelem 655360 timeout 14400
# iptables -I INPUT 1 -m set --match-set ddosBlock src -j DROP
# */20 * * * * /root/scripts/ddos.sh 2>&1 | logger -t ddosBlock

# vps=$(hostname -I | awk '{ print $1 }')

netstat -tulpna | grep FIN_WAIT1 | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | sort | uniq -c | awk '$1 > 50 { print $2}' | sed -e '/207.246.87.96/d' |
while read ip
do
    echo ipset add ddosBlock $ip
    ipset add ddosBlock $ip
    conntrack -D --src $ip > /dev/null
done
```
