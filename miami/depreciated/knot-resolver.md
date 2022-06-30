### read the docs
- [Knot-resolver.cz](https://www.knot-resolver.cz)
- [Read the Docs](https://readthedocs.org/projects/knot-resolver/downloads/pdf/stable)
- [DNS flagday 2020](https://dnsflagday.net/2020)
- [SDNS 2021](https://www.youtube.com/playlist?list=PLDlEgzZB7eyJ0_Y2U2Y3Vv5kjj7DmeBIM)

### before installing knot resolver
#### you must have:
- purhased a domain name
- set up dns A, quadA records
- enabled DNNSEC for your domain (needed for prefill)
- have valid SSL certs (use ecc not rsa)

### install knot-resolver for Debian 10 buster
- OFFICIAL [download](https://www.knot-resolver.cz/download/) to add repo.

#### this will create knot-resolver-latest.list in /etc/apt/sources.list.d and add gpg key
```sh
wget https://secure.nic.cz/files/knot-resolver/knot-resolver-release.deb
dpkg -i knot-resolver-release.deb
apt update
apt install -y knot-resolver

```

### configure knot-resolver

#### cat /etc/knot-resolver/kresd.conf
```sh
-- SPDX-License-Identifier: CC0-1.0
-- vim:syntax=lua:set ts=4 sw=4:
-- Refer to manual: https://knot-resolver.readthedocs.org/en/stable/

-- Network interface configuration
net.listen('127.0.0.1', 53, { kind = 'dns' })                                      -- local  dns  ipv4
net.listen('45.63.110.187', 853, { kind = 'tls' })                                 -- public dot  ipv4
net.listen('45.63.110.187', 443, { kind = 'doh2' })                                -- public doh2 ipv4
net.listen('::1', 53, { kind = 'dns', freebind = true })                           -- local  dns  ipv6
net.listen('2001:19f0:9002:1d74:5400::1', 853, { kind = 'tls', freebind = true })  -- public dot  ipv6
net.listen('2001:19f0:9002:1d74:5400::1', 443, { kind = 'doh2', freebind = true }) -- public doh2 ipv6
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
              interval = 86400,
              ca_file = '/etc/ssl/certs/ca-certificates.crt',
}
})

-- serve timed-out records
modules = { 'serve_stale < cache' }

-- http config for prometheus
http.config({ tls = false, })
http.prometheus.namespace = 'resolver_'

-- tmpfs non-persistent cache 1gb
cache.size = cache.fssize() - 10*MB

-- cdc.gov broken DNSSEC
trust_anchors.set_insecure{'cdc.gov'}

```

### add tmpfs for cache
#### add the following to /etc/fstab
```sh
tmpfs        /var/cache/knot-resolver        tmpfs   rw,size=1G,uid=knot-resolver,gid=knot-resolver,nosuid,nodev,noexec,mode=0700 0 0
```
#### mount tmpfs
```.sh
mount -a
```

#### start and enable knot-resolver

```sh
systemctl enable --now kresd@1.service
```

#### check status
```sh
systemctl status kresd@1.service
● kresd@1.service - Knot Resolver daemon
   Loaded: loaded (/lib/systemd/system/kresd@.service; enabled; vendor preset: enabled)
   Active: active (running) since Sat 2021-02-13 23:21:19 UTC; 2s ago
     Docs: man:kresd.systemd(7)
           man:kresd(8)
 Main PID: 11665 (kresd)
    Tasks: 1 (limit: 1148)
   Memory: 8.6M
   CGroup: /system.slice/system-kresd.slice/kresd@1.service
           └─11665 /usr/sbin/kresd -c /usr/lib/knot-resolver/distro-preconfig.lua -c /etc/knot-resolver/kresd.conf -n

Feb 13 23:21:18 doh1 systemd[1]: Starting Knot Resolver daemon...
Feb 13 23:21:19 doh1 kresd[455]: [tls] RFC 7858 OOB key-pin (0): pin-sha256=""
Feb 13 23:21:19 doh1 kresd[455]: [tls] RFC 7858 OOB key-pin (1): pin-sha256=""
Feb 13 23:21:19 doh1 systemd[1]: Started Knot Resolver daemon.
Feb 13 23:21:19 doh1 systemd[1]: Reached target Knot Resolver daemons.
Feb 13 23:21:19 doh1 systemd[1]: Started Knot Resolver Garbage Collector daemon.
Feb 13 23:21:19 doh1 kresd[455]: [ta_update] refreshing TA for .
Feb 13 23:21:19 doh1 kresd[455]: [prefill] root zone file valid for 01 hours 02 minutes, reusing data from disk
Feb 13 23:21:19 doh1 kres-cache-gc[641]: Knot Resolver Cache Garbage Collector, version 5.2.1
Feb 13 23:21:19 doh1 kresd[455]: [prefill] root zone successfully parsed, import started
Feb 13 23:21:19 doh1 kresd[455]: [prefill] root zone refresh in 01 hours 02 minutes
Feb 13 23:21:19 doh1 kresd[455]: [ta_update] refreshing TA for .
Feb 13 23:21:20 doh1 kresd[455]: [ta_update] next refresh for . in 12 hours
```
