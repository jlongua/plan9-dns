### read the docs
- https://www.knot-resolver.cz/
- https://readthedocs.org/projects/knot-resolver/downloads/pdf/stable/
- https://dnsflagday.net/2020/

### install knot-resolver for Debian 10 buster
- https://software.opensuse.org//download.html?project=home%3ACZ-NIC%3Aknot-resolver-latest&package=knot-resolver

```sh
For Debian 10 run the following:

echo 'deb http://download.opensuse.org/repositories/home:/CZ-NIC:/knot-resolver-latest/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/home:CZ-NIC:knot-resolver-latest.list
curl -fsSL https://download.opensuse.org/repositories/home:CZ-NIC:knot-resolver-latest/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_CZ-NIC_knot-resolver-latest.gpg > /dev/null
sudo apt update
sudo apt install knot-resolver
```

### configure knot-resolver
```sh
# cat /etc/knot-resolver/kresd.conf
-- SPDX-License-Identifier: CC0-1.0
-- vim:syntax=lua:set ts=4 sw=4:
-- Refer to manual: https://knot-resolver.readthedocs.org/en/stable/

-- Network interface configuration
net.listen('127.0.0.1', 53, { kind = 'dns' })
net.listen('104.156.246.39', 853, { kind = 'tls' })
net.listen('104.156.246.39', 443, { kind = 'doh2' })
net.listen('::1', 53, { kind = 'dns', freebind = true })
net.listen('2001:19f0:9002:2a18:5400::1', 853, { kind = 'tls', freebind = true })
net.listen('2001:19f0:9002:2a18:5400::1', 443, { kind = 'doh2' })
net.tls("/etc/letsencrypt/plan9-dns.com_ecc/fullchain.pem", "/etc/letsencrypt/plan9-dns.com_ecc/private.key")

-- Load useful modules
modules = {
	'hints > iterate',  -- Load /etc/hosts and allow custom root hints
	'stats',            -- Track internal statistics
	'predict',          -- Prefetch expiring/frequent records
}

-- Cache size
cache.size = 250 * MB
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
