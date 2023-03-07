#!/bin/bash

# SSL certs are aquired on a seperate vps and scp'ed to DNS servers as needed.
# this script runs on the SSL cert manager vps.

# stat -c %Z fullchain.pem > last
# last=$(stat -c %Z fullchain.pem)
## visudo
# yourUser ALL=NOPASSWD:/usr/bin/scp
## crontab
# SHELL=/bin/bash
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# 0 0 * * * /root/scripts/certpush.sh 2>&1  | logger -t certPush

# first time init
#
if [[ ! -f "/etc/zerossl/plan9-dns.com_ecc/last" ]]; then
   echo "file last is not exist"
   echo "creating file last"
   stat -c %Z /etc/zerossl/plan9-dns.com_ecc/fullchain.pem > /etc/zerossl/plan9-dns.com_ecc/last
else
   echo "file last is exist"
fi

# check for updated SSl Certs
#
if [[ $(cat /etc/zerossl/plan9-dns.com_ecc/last) != $(stat -c %Z /etc/zerossl/plan9-dns.com_ecc/fullchain.pem) ]]; then
    echo "fullchain.pem has changed."
    echo "scp new certs to dns servers"
    chmod 640 /etc/zerossl/plan9-dns.com_ecc/private.key
    sudo -u  yourUser /usr/bin/scp /etc/zerossl/plan9-dns.com_ecc/fullchain.pem helios-ssl:/home/yourUser/ssl
    sudo -u  yourUser /usr/bin/scp /etc/zerossl/plan9-dns.com_ecc/private.key helios-ssl:/home/yourUser/ssl
    sudo -u  yourUser /usr/bin/scp /etc/zerossl/plan9-dns.com_ecc/fullchain.pem kronos-ssl:/home/yourUser/ssl
    sudo -u  yourUser /usr/bin/scp /etc/zerossl/plan9-dns.com_ecc/private.key kronos-ssl:/home/yourUser/ssl
    sudo -u  yourUser /usr/bin/scp /etc/zerossl/plan9-dns.com_ecc/fullchain.pem pluton-ssl:/home/yourUser/ssl
    sudo -u  yourUser /usr/bin/scp /etc/zerossl/plan9-dns.com_ecc/private.key pluton-ssl:/home/yourUser/ssl
    chmod 600 /etc/zerossl/plan9-dns.com_ecc/private.key
    stat -c %Z /etc/zerossl/plan9-dns.com_ecc/fullchain.pem > /etc/zerossl/plan9-dns.com_ecc/last
else
echo "fullchain.pem has NOT changed"
fi
