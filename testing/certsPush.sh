#!/bin/bash

# script to push certs from certManager vps to encrypted-dns servers
# cronjob 0 0 * * * /root/scripts/certsPush.sh 2>&1 | logger -t certsPush
# stat -c %Z fullchain.pem > last
# last=$(stat -c %Z fullchain.pem)

# first time init
#
if [[ -f "/etc/zerossl/plan9-dns.com_ecc/last" ]]; then
    echo "File is exist"
else
   echo "File is not exist"
   echo "creating file last"
   stat -c %Z /etc/zerossl/plan9-dns.com_ecc/fullchain.pem > /etc/zerossl/plan9-dns.com_ecc/last
fi

# check for updated SSl Certs
#
if [[ $(cat /etc/zerossl/plan9-dns.com_ecc/last) != $(stat -c %Z /etc/zerossl/plan9-dns.com_ecc/fullchain.pem) ]]; then
    echo "fullchain.pem has changed"
    echo "scp new certs to vps's"
    chmod 640 /etc/zerossl/plan9-dns.com_ecc/private.key
    sudo -u  yourUser /usr/bin/scp /etc/zerossl/plan9-dns.com_ecc/fullchain.pem helios-ssl:/home/yourUser/ssl
    sudo -u  yourUser /usr/bin/scp /etc/zerossl/plan9-dns.com_ecc/private.key helios-ssl:/home/yourUser/ssl
    chmod 600 /etc/zerossl/plan9-dns.com_ecc/private.key
    stat -c %Z /etc/zerossl/plan9-dns.com_ecc/fullchain.pem > /etc/zerossl/plan9-dns.com_ecc/last
else
    echo "fullchain.pem has NOT changed"
fi
