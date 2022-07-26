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

##### Even with these issues the New Jersey and Florida plan-dns resolvers will be upgraded to dnsdist due to memory issues with encrypted-dns server and the DoH server being to permissive.
  
