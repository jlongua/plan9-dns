With encrypted-dns v0.9.6 and debian 11 was experiencing a severe memory leak.
Memory was being consumed in ~8 hours and oom kicked in.

With encrypted-dns v0.3.23 and debian 10 there was no memory leak...

For now I have downgraded encrypted-dns to v0.3.23 and appears stable.

Most of the updates to encrypted-dns were dependency updates, except for
v0.9.5 that was for fixing - The server would previously stop accepting connections if the system ran out of file descriptors.

there was also an update https://github.com/DNSCrypt/encrypted-dns-server/commit/dbed0a086720ad276f2c0276a0f1f0dc13c3c397
that has to do with Create certificates using a rolling state

https://github.com/DNSCrypt/encrypted-dns-server/issues/70

will have to try compiling from source
okay, installed rust and compiled encrypted-dns per instuction and ended up with encrypted-dns v0.9.7

Installed encrypted-dns v0.9.7 on helios Mexico City resolver and so far looks promising
Installed encrypted-dns v0.9.7 on kronos New Jersey and pluton Florida resolvers, appears stable

unfortunately had to revert to encrypted-dns v0.3.23 due to segfaults
```sh
Jul  7 19:36:56 pluton systemd[1]: encrypted-dns.service: Main process exited, code=killed, status=11/SEGV
Jul  7 19:36:56 pluton systemd[1]: encrypted-dns.service: Failed with result 'signal'.
Jul  7 19:36:56 pluton systemd[1]: encrypted-dns.service: Consumed 7.829s CPU time.
Jul  7 19:36:56 pluton systemd[1]: encrypted-dns.service: Scheduled restart job, restart counter is at 18.
Jul  7 19:36:56 pluton systemd[1]: encrypted-dns.service: Consumed 7.829s CPU time.
```

more problems, v0.3.23 and also v0.9.1 ramdomly stop accepting udp connections and require a restart of encrypted-dns...
looks like debian 11 doesn't like encrypted-dns server.

I understand that the docker container of encrypted-dns is built on a minimal version of ubuntu, maybe spin up an ubuntu vps.
