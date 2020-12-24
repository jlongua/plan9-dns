# plan9-dns

This is the actual configs used...

Thanks to Frank Denis and other contributors for making this project possible.\
https://dnscrypt.info
\
https://github.com/DNSCrypt/dnscrypt-server-docker

plan9-dns dnscrypt protocol
hosted on Vultr vps in New Jersey, USA

Debian Buster\
docker, dnscrypt-server-docker, prometheus, iptables, fail2ban

grafana custom dashboard - https://github.com/jlongua/plan9-dns/blob/main/plan9-dns-1604620842794.json

abuse:
while logs are not collected or saved,
an administrator can see ip's that are connected at that moment in time,
it is an easy matter to grep connections of know abusive ip's,
if you are listed on abuseipdb.com at 100% confidence you will be blocked from further access.
This unfortunately applies to tor, exit or not.
Because of excessive bandwith of some users, generous rate limits will be applied... eventually, will update when limits are in place.
https://making.pusher.com/per-ip-rate-limiting-with-iptables/#fnref:hashlimit-hashtable-mess
