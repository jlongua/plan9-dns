### read the docs
- [DNScrypt.info](https://dnscrypt.info)
- [encrypted-dns](https://github.com/jedisct1/encrypted-dns-server)

### download and install
```sh
# wget https://github.com/jedisct1/encrypted-dns-server/releases/download/0.3.23/encrypted-dns_0.3.23_amd64.deb
# dpkg -i encrypted-dns_0.3.23_amd64.deb
```

### configure encrypted-dns
```sh
# cat /etc/encrypted-dns/encrypted-dns.toml
####################################################
#                                                  #
#        Encrypted DNS Server configuration        #
#                                                  #
####################################################



##################################
#         Global settings        #
##################################


## IP addresses and ports to listen to, as well as their external IP
## If there is no NAT involved, `local` and `external` can be the same.
## As many addresses as needed can be configured here, IPv4 and/or IPv6.
## You should at least change the `external` IP address.

### Example with both IPv4 and IPv6 addresses:
# listen_addrs = [
#     { local = "0.0.0.0:443",    external = "198.51.100.1:443" },
#     { local = "[::]:443",       external = "[2001:db8::1]:443" }
# ]

listen_addrs = [
    { local = "0.0.0.0:8443", external = "45.63.110.187:8443" },
    { local = "[::]:8443",       external = "[2001:19f0:9002:1d74:5400:3ff:fe35:774a]:8443" }
]


## Upstream DNS server and port

upstream_addr = "127.0.0.1:53"


## File name to save the state to

state_file = "/etc/encrypted-dns/keys/state/encrypted-dns.state"


## UDP timeout in seconds

udp_timeout = 10


## TCP timeout in seconds

tcp_timeout = 10


## Maximum active UDP sockets

udp_max_active_connections = 1000


## Maximum active TCP connections

tcp_max_active_connections = 100


## Optional IP address to connect to upstream servers from.
## Leave commented/undefined to automatically select it.

# external_addr = "0.0.0.0"


## Built-in DNS cache capacity

cache_capacity = 150000


## DNS cache: minimum TTL

cache_ttl_min = 3600


## DNS cache: max TTL

cache_ttl_max = 86400


## DNS cache: error TTL

cache_ttl_error = 600


## DNS cache: to avoid bursts of traffic for popular queries when an
## RRSET expires, hold a TTL received from an upstream server for
## `client_ttl_holdon` seconds before decreasing it in client responses.

client_ttl_holdon = 60


## Run as a background process

daemonize = false


## Log file

# log_file = "/tmp/encrypted-dns.log"


## PID file

# pid_file = "/tmp/encrypted-dns.pid"


## User name to drop privileges to, when started as root.

user = "encrypted-dns"


## Group name to drop privileges to, when started as root.

group = "encrypted-dns"


## Path to chroot() to, when started as root.
## The path to the state file is relative to the chroot base.

# chroot = "/var/empty"


## Queries sent to that name will return the client IP address.
## This can be very useful for debugging, or to check that relaying works.

# my_ip = "my.ip"


####################################
#         DNSCrypt settings        #
####################################

[dnscrypt]

## Provider name (with or without the `2.dnscrypt-cert.` prefix)

provider_name = "2.dnscrypt-cert.plan9-ns2.com"


## Does the server support DNSSEC?

dnssec = true


## Does the server always returns correct answers (no filtering, including ad blocking)?

no_filters = true


## Set to `true` if the server doesn't keep any information that can be used to identify users

no_logs = true


## Key cache capacity, per certificate

key_cache_capacity = 10000



###############################
#         TLS settings        #
###############################

[tls]

## Where to proxy TLS connections to (e.g. DoH server)

# upstream_addr = "127.0.0.1:4343"





#######################################
#        Server-side filtering        #
#######################################

[filtering]

## List of domains to block, one per line




## List of undelegated TLDs
## This is the list of nonexistent TLDs that queries are frequently observed for,
## but will never resolve to anything. The server will immediately return a
## synthesized NXDOMAIN response instead of hitting root servers.

undelegated_list = "/etc/encrypted-dns/undelegated.txt"


## Ignore A and AAAA queries for unqualified host names.

ignore_unqualified_hostnames = true



#########################
#        Metrics        #
#########################

[metrics]

type = "prometheus"
listen_addr = "0.0.0.0:9100"
path = "/metrics"



################################
#        Anonymized DNS        #
################################

[anonymized_dns]

# Enable relaying support for Anonymized DNS

enabled = true


# Allowed upstream ports
# This is a list of commonly used ports for encrypted DNS services

allowed_ports = [ 443, 553, 853, 1443, 2053, 4343, 4434, 4443, 5353, 5443, 8443, 15353 ]


# Allow all ports >= 1024 in addition to the list above

allow_non_reserved_ports = false


# Blacklisted upstream IP addresses

blacklisted_ips = [  ]




################################
#        Access control        #
################################

[access_control]

# Enable access control

enabled = false

# Only allow access to client queries including one of these random tokens
# Tokens can be configured in the `query_meta` section of `dnscrypt-proxy` as
# `query_meta = ["token:..."]` -- Replace ... with the token to use by the client.
# Example: `query_meta = ["token:Y2oHkDJNHz"]`

tokens = ["Y2oHkDJNHz", "G5zY3J5cHQtY", "C5zZWN1cmUuZG5z"]
```

### start encrypted-dns server from cli and show certs
```sh
# encrypted-dns --dry-run --config /etc/encrypted-dns/encrypted-dns.toml 
[INFO ] Dropping privileges
[WARN ] No state file found... creating a new provider key
[INFO ] Public server address: 45.63.110.187:8443
[INFO ] Provider public key:... 
[INFO ] Provider name: 2.dnscrypt-cert.plan9-ns2.com
[INFO ] DNS Stamp: sdns://...
[INFO ] DNS Stamp for Anonymized DNS relaying: sdns://...
[INFO ] Public server address: [2001:19f0:9002:1d74:5400::1]:8443
[INFO ] Provider public key:...
[INFO ] Provider name: 2.dnscrypt-cert.plan9-ns2.com
[INFO ] DNS Stamp: sdns://...
[INFO ] DNS Stamp for Anonymized DNS relaying: sdns://...
```

### add systemd unit
```sh
# cat /lib/systemd/system/encrypted-dns.service
[Unit]
Description=Encrypted DNS Server
Documentation=https://github.com/jedisct1/encrypted-dns-server
Wants=network-online.target
After=network-online.target
 
[Service]
Type=simple
ExecStart=/usr/bin/encrypted-dns --config /etc/encrypted-dns/encrypted-dns.toml
Restart=always

[Install]
WantedBy=multi-user.target
```
### start encrypted-dns server
```sh
# systemctl daemon-reload
# systemctl start encrypted-dns
# systemctl enable encrypted-dns
Created symlink /etc/systemd/system/multi-user.target.wants/encrypted-dns.service → /lib/systemd/system/encrypted-dns.service.
# systemctl status encrypted-dns
● encrypted-dns.service - Encrypted DNS Server
   Loaded: loaded (/lib/systemd/system/encrypted-dns.service; enabled; vendor preset: enabled)
   Active: active (running) since Fri 2021-03-19 21:21:35 UTC; 11min ago
     Docs: https://github.com/jedisct1/encrypted-dns-server
 Main PID: 6684 (encrypted-dns)
    Tasks: 3 (limit: 1148)
   Memory: 41.9M
   CGroup: /system.slice/encrypted-dns.service
           └─6684 /usr/bin/encrypted-dns --config /etc/encrypted-dns/encrypted-dns.toml

Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] Public server address: 45.63.110.187:8443
Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] Provider public key:...
Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] Provider name: 2.dnscrypt-cert.plan9-ns2.com
Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] DNS Stamp: sdns://...
Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] DNS Stamp for Anonymized DNS relaying: sdns://...
Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] Public server address: [2001:19f0:9002:1d74:5400::1]:8443
Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] Provider public key:...
Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] Provider name: 2.dnscrypt-cert.plan9-ns2.com
Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] DNS Stamp: sdns://...
Mar 19 21:21:35 draco.plan9-ns2.com encrypted-dns[6684]: [INFO ] DNS Stamp for Anonymized DNS relaying: sdns://...
```
