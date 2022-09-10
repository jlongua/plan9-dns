#!/bin/bash
#
# set cronjob to run script once a day
#
# first time init
if [ -f "/root/scripts/last" ]; then
    echo "File is exist"
else
   echo "File is NOT exist"
   echo "creating file last"
   stat -c %Z /etc/zerossl/plan9-dns.com_ecc/fullchain.pem > last
fi

# check for updated SSl Certs
if [ $(cat last) != $(stat -c %Z /etc/zerossl/plan9-dns.com_ecc/fullchain.pem) ]; then
    echo "fullchain.pem has changed."
    echo "running dnsdist load new certs for Doh and Dot binds"
    /usr/bin/dnsdist -e "getDOHFrontend(0):loadNewCertificatesAndKeys("/etc/zerossl/plan9-dns.com_ecc/fullchain.pem", "/etc/zerossl/plan9-dns.com_ecc/private.key")"
    /usr/bin/dnsdist -e "getDOHFrontend(1):loadNewCertificatesAndKeys("/etc/zerossl/plan9-dns.com_ecc/fullchain.pem", "/etc/zerossl/plan9-dns.com_ecc/private.key")"
    /usr/bin/dnsdist -e "getTLSFrontend(0):loadNewCertificatesAndKeys("/etc/zerossl/plan9-dns.com_ecc/fullchain.pem", "/etc/zerossl/plan9-dns.com_ecc/private.key")"
    /usr/bin/dnsdist -e "getTLSFrontend(1):loadNewCertificatesAndKeys("/etc/zerossl/plan9-dns.com_ecc/fullchain.pem", "/etc/zerossl/plan9-dns.com_ecc/private.key")"
    stat -c %Z /etc/zerossl/plan9-dns.com_ecc/fullchain.pem > last
else
    echo "fullchain.pem has NOT changed"
fi
