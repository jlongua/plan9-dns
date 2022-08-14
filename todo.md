pluton is failing health checks with knot-resolver backend, also excessive downstream-timeouts. Maybe try pdns-recursor.
- PowerDNS-recursor is working great, no more failed health checks, will switch over kronos and helios, also.

make script to push certs on renewal from cert manager vps to resolver servers and restart services

remove prometheus from resolver servers and create prometheus server on cert manager vps
