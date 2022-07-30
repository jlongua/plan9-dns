dnsdist as a front end for DoH and DoT works great, but DNSCrypt has some issues.
##### dnsdist DNSCrypt
- I'm having an issue with dnscrypt ipv6 not finding a usable cert after the original cert that dnsdist started with expires\
  or is marked inactive even though certs have been rotated. ipv4 sees the rotated cert but ipv6 does not.\
  The error from dnscrypt-proxy using ipv6 is no useable cert found. So for now no dnscrypt ipv6.
- When  a cert is marked inactive to soon from new cert generation client is dropped. Need to allow plus 4 hours for\
  dnscrypt-proxy to pickup new cert. This is not how its supposed to work, an inactive cert should still be useable...\
  for now no marking inactive, just let certs expire... more testing is needed.
- When restarting dnsdist all dnscrypt clients are dropped due to last active cert having been generated and loaded\
  in memory is lost during restart.
  
A new realease of encrypted-dns server looks promising...
The ideal setup would be encrypted-dns server in front of dnsdist and dnsdist using knot-resolver as the backend.

##### Even with these issues the New Jersey and Florida plan9-dns resolvers will be upgraded to dnsdist due to memory issues with encrypted-dns server and the DoH server being to permissive.
  
encrypted-dns server in front of dnsdist on the Mexico plan9-dns resolver is live...

encrypted-dns server v0.9.7 is having gpf
```sh
Jul 29 22:04:15 helios kernel: [546543.712378] traps: encrypted-dns-[42995] general protection fault ip:55d323463171 sp:7f8f0f6e9078 error:0 in encrypted-dns[55d3232d7000+1ad000]
Jul 29 22:04:15 helios systemd[1]: encrypted-dns.service: Main process exited, code=killed, status=11/SEGV
Jul 29 22:04:15 helios systemd[1]: encrypted-dns.service: Failed with result 'signal'.
Jul 29 22:04:15 helios systemd[1]: encrypted-dns.service: Consumed 18.611s CPU time.
Jul 29 22:04:15 helios systemd[1]: encrypted-dns.service: Scheduled restart job, restart counter is at 1.
Jul 29 22:04:16 helios systemd[1]: Stopped Encrypted DNS Server.
Jul 29 22:04:16 helios systemd[1]: encrypted-dns.service: Consumed 18.611s CPU time.
Jul 29 22:04:16 helios systemd[1]: Started Encrypted DNS Server.
```
had to revert to encrypted-dns server v0.9.6 which works but is having memory comsumption problems...
restarting encrypted-dns-server service occasionaly to mitigate the problem so oom-killer doesn't kick in.
