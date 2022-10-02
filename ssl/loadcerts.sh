#!/bin/bash

# stat -c %Z fullchain.pem > last
# last=$(stat -c %Z fullchain.pem)
## crontab
# SHELL=/bin/bash
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# 0 1 * * * /root/scripts/loadcerts.sh 2>&1 | logger -t loadNewCerts

# first time init
if [[ ! -f "/home/yellowtom/ssl/last" ]]; then
   echo "file last is not exist"
   echo "creating file last"
   stat -c %Z /home/yellowtom/ssl/fullchain.pem > /home/yellowtom/ssl/last
else
    echo "file last is exist"
fi

# check for updated ssl Certs
#
if [[ $(cat /home/yourUser/ssl/last) != $(stat -c %Z /home/yourUser/ssl/fullchain.pem) ]]; then
    echo "fullchain.pem has changed"
    cp /home/yourUser/ssl/fullchain.pem /etc/zerossl/plan9-dns.com_ecc/fullchain.pem
    cp /home/yourUser/ssl/private.key /etc/zerossl/plan9-dns.com_ecc/private.key
    chmod 600 /etc/zerossl/plan9-dns.com_ecc/private.key
    chown _dnsdist:_dnsdist /etc/zerossl/plan9-dns.com_ecc/fullchain.pem
    chown _dnsdist:_dnsdist /etc/zerossl/plan9-dns.com_ecc/private.key
    echo "running dnsdist load new certs for Doh and Dot binds"
    /usr/bin/dnsdist -e "getDOHFrontend(0):loadNewCertificatesAndKeys("/etc/zerossl/plan9-dns.com_ecc/fullchain.pem", "/etc/zerossl/plan9-dns.com_ecc/private.key")"
    /usr/bin/dnsdist -e "getDOHFrontend(1):loadNewCertificatesAndKeys("/etc/zerossl/plan9-dns.com_ecc/fullchain.pem", "/etc/zerossl/plan9-dns.com_ecc/private.key")"
    /usr/bin/dnsdist -e "getTLSFrontend(0):loadNewCertificatesAndKeys("/etc/zerossl/plan9-dns.com_ecc/fullchain.pem", "/etc/zerossl/plan9-dns.com_ecc/private.key")"
    /usr/bin/dnsdist -e "getTLSFrontend(1):loadNewCertificatesAndKeys("/etc/zerossl/plan9-dns.com_ecc/fullchain.pem", "/etc/zerossl/plan9-dns.com_ecc/private.key")"
    stat -c %Z /home/yourUser/ssl/fullchain.pem > /home/yourUser/ssl/last
else
echo "fullchain.pem has NOT changed"
fi
