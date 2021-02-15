### read the docs
- https://www.knot-resolver.cz/
- https://readthedocs.org/projects/knot-resolver/downloads/pdf/stable/
- https://dnsflagday.net/2020/

### install knot-resolver for Debian 10 buster
- OFFICIAL download to add repo
- https://www.knot-resolver.cz/download/

#### this will create knot-resolver-latest.list in /etc/apt/sources.list.d and add gpg key
```sh
wget https://secure.nic.cz/files/knot-resolver/knot-resolver-release.deb
dpkg -i knot-resolver-release.deb
apt update
apt install -y knot-resolver

```

### configure knot-resolver

### cat /etc/knot-resolver/kresd.conf
```sh
-- SPDX-License-Identifier: CC0-1.0
-- vim:syntax=lua:set ts=4 sw=4:
-- Refer to manual: https://knot-resolver.readthedocs.org/en/stable/

-- Network interface configuration
net.listen('127.0.0.1', 53, { kind = 'dns' })                                      -- local  dns  ipv4
net.listen('104.156.246.39', 853, { kind = 'tls' })                                -- public dot  ipv4
net.listen('104.156.246.39', 443, { kind = 'doh2' })                               -- public doh2 ipv4
net.listen('::1', 53, { kind = 'dns', freebind = true })                           -- local  dns  ipv6
net.listen('2001:19f0:9002:2a18:5400::1', 853, { kind = 'tls', freebind = true })  -- public dot  ipv6
net.listen('2001:19f0:9002:2a18:5400::1', 443, { kind = 'doh2', freebind = true }) -- public doh2 ipv6
net.listen('127.0.0.1', 8453, { kind = 'webmgmt' })                                -- local  http prometheus
net.tls("/etc/letsencrypt/plan9-dns.com_ecc/fullchain.pem", "/etc/letsencrypt/plan9-dns.com_ecc/private.key")

-- Load useful modules
modules = {
	'hints > iterate',  -- Load /etc/hosts and allow custom root hints
	'stats',            -- Track internal statistics
	'predict',          -- Prefetch expiring/frequent records
        'http',             -- Expose Metrics endpoint for prometheus
}

-- prefill root zone data - domain must be DNSSEC secured
modules.load('prefill')
prefill.config({
      ['.'] = {
              url = 'https://www.internic.net/domain/root.zone',
              interval = 86400 -- seconds
      }
})

-- serve timed-out records
modules = { 'serve_stale < cache' }

-- http config for prometheus
http.config({ tls = false, })
http.prometheus.namespace = 'resolver_'

-- tmpfs non-persistent cache 250mb
cache.size = cache.fssize() - 10*MB

-- cdc.gov broken DNSSEC
trust_anchors.set_insecure{'cdc.gov'}

```

### start and enable knot-resolver

```sh
systemctl enable --now kresd@1.service
```

### check status
```sh
systemctl status kresd@1.service
● kresd@1.service - Knot Resolver daemon
   Loaded: loaded (/lib/systemd/system/kresd@.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2021-02-08 16:10:59 UTC; 2s ago
     Docs: man:kresd.systemd(7)
           man:kresd(8)
 Main PID: 11665 (kresd)
    Tasks: 1 (limit: 1148)
   Memory: 8.6M
   CGroup: /system.slice/system-kresd.slice/kresd@1.service
           └─11665 /usr/sbin/kresd -c /usr/lib/knot-resolver/distro-preconfig.lua -c /etc/knot-resolver/kresd.conf -n

Feb 08 16:10:59 doh1.plan9-dns.com systemd[1]: Starting Knot Resolver daemon...
Feb 08 16:10:59 doh1.plan9-dns.com kresd[11665]: [tls] RFC 7858 OOB key-pin (0): pin-sha256=""
Feb 08 16:10:59 doh1.plan9-dns.com kresd[11665]: [tls] RFC 7858 OOB key-pin (1): pin-sha256=""
Feb 08 16:10:59 doh1.plan9-dns.com systemd[1]: Started Knot Resolver daemon.
Feb 08 16:10:59 doh1.plan9-dns.com kresd[11665]: [ta_update] refreshing TA for .
Feb 08 16:10:59 doh1.plan9-dns.com kresd[11665]: [ta_update] next refresh for . in 12 hours
```
