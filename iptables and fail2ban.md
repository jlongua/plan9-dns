## Install fail2ban to help protect ssh port 22

### In the vultr control panel under Firewall
- add a firewall for your dnscrypt vps
- open ports 443 tcp and udp, 123 udp, 9090 tcp
- open port 22 tcp (as needed)

### iptables rules
- prometheus port 9090 secured with iptables

```sh
-P INPUT ACCEPT
-P FORWARD DROP
-P OUTPUT ACCEPT
-N DOCKER
-N DOCKER-ISOLATION-STAGE-1
-N DOCKER-USER
-N DOCKER-ISOLATION-STAGE-2
-N metrics
-A INPUT -i lo -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -p udp -m udp --dport 443 -j ACCEPT
-A INPUT -p udp -m udp --dport 123 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 9090 -j metrics
-A INPUT -j LOG
-A INPUT -j DROP
-A FORWARD -j DOCKER-USER
-A FORWARD -j DOCKER-ISOLATION-STAGE-1
-A FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -o docker0 -j DOCKER
-A FORWARD -i docker0 ! -o docker0 -j ACCEPT
-A FORWARD -i docker0 -o docker0 -j ACCEPT
-A DOCKER-ISOLATION-STAGE-1 -i docker0 ! -o docker0 -j DOCKER-ISOLATION-STAGE-2
-A DOCKER-ISOLATION-STAGE-1 -j RETURN
-A DOCKER-USER -j RETURN
-A DOCKER-ISOLATION-STAGE-2 -o docker0 -j DROP
-A DOCKER-ISOLATION-STAGE-2 -j RETURN
-A metrics -s 208.167.xxx.xxx/32 -j ACCEPT   # ip's allowed to accesss prometheus metrics
-A metrics -s 91.132.xxx.xxx/32 -j ACCEPT    # not actual ips
-A metrics -s 156.96.xxx.xxx/32 -j ACCEPT
-A metrics -s 194.36.xxx.xxx/32 -j ACCEPT
-A metrics -j DROP
```

### make rules persistent
```sh
apt install iptables-persistent
iptables-save > /etc/iptables/rules.v4
```
