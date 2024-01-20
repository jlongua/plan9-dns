incoming:
  allow_from:
  - 127.0.0.0/8
  - ::1/128
  listen:
  - 127.0.0.1
  - ::1
  port: 53
logging:
  disable_syslog: false
  facility: '1'
  loglevel: 6
  quiet: true
outgoing:
  source_address:
  - 0.0.0.0
  - '::'
packetcache:
  max_entries: 75000
recordcache:
  max_entries: 150000
recursor:
  any_to_tcp: true
  config_dir: /etc/powerdns
  hint_file: /usr/share/dns/root.hints
  include_dir: /etc/powerdns/recursor.d
  lua_config_file: /etc/powerdns/recursor.lua
  qname_minimization: true
  setgid: pdns
  setuid: pdns
webservice:
  address: 127.0.0.1
  allow_from:
  - 127.0.0.1
  loglevel: none
  port: 8081
  webserver: true
