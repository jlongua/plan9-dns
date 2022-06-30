catch ssh login attempts in a bucket
```
iptables -A INPUT -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW -m hashlimit --hashlimit-above 1/hour --hashlimit-burst 2 --hashlimit-mode srcip --hashlimit-name ssh -j DROP
```

set crontab to run script to add ssh ip's to ipset
```
*/30 * * * * /root/crontabs/ssh_watch.sh 2>&1 | logger -t ssh_watch
```

ssh script
```
#!/bin/bash
### ssh honey pot
### watch --interval 1 "cat /proc/net/ipt_hashlimit/ssh"
cat /proc/net/ipt_hashlimit/ssh > /root/crontabs/tmp/watchlist_ssh
### need to remove my vpn ip !
cat /root/crontabs/tmp/watchlist_ssh | sed '/my.vpn.ip/d' | sed '/my.vpn.ip/d' | sed 's/:0->0.0.0.0:0//g' | awk '{print $2}' | sort | uniq > /root/crontabs/tmp/watchlist_ssh.srt
for ip in $(cat /root/crontabs/tmp/watchlist_ssh.srt); do ipset -exist -A ssh $ip;done
ipset save > /etc/iptables/ipsets
```
