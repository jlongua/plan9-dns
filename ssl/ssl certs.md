- #### acme.sh, lexicon dns for SSL certs

#### acme.sh install
```sh
apt install socat
curl https://get.acme.sh | sh -s email=plan9-dns@my-email.com

acme.sh --version
https://github.com/acmesh-official/acme.sh
v3.0.5
```
#### lexicon install
```sh
apt install python3-pip
pip3 install dns-lexicon

lexicon --version
lexicon 3.11.2
```
#### issue ssl certs
okay, I forgot that acme.sh now defaults to zerossl\
so for now I am using zerossl

I added  a user with a limited api key that can only be used for DNS changes
```sh
export PROVIDER=vultr
export LEXICON_VULTR_USERNAME="plan9"
export LEXICON_VULTR_TOKEN="yada yada yada"
```
```sh
acme.sh --issue --dns dns_lexicon -d plan9-dns.com -d 'helios.plan9-dns.com' -d 'kronos.plan9-dns.com' -d 'pluton.plan9-dns.com' --keylength ec-256

[Mon 23 May 2022 12:20:34 AM UTC] Using CA: https://acme.zerossl.com/v2/DV90
[Mon 23 May 2022 12:20:34 AM UTC] Multi domain='DNS:plan9-dns.com,DNS:helios.plan9-dns.com,DNS:kronos.plan9-dns.com,DNS:pluton.plan9-dns.com'
[Mon 23 May 2022 12:20:34 AM UTC] Getting domain auth token for each domain
[Mon 23 May 2022 12:21:12 AM UTC] Getting webroot for domain='plan9-dns.com'
[Mon 23 May 2022 12:21:12 AM UTC] Getting webroot for domain='helios.plan9-dns.com'
[Mon 23 May 2022 12:21:12 AM UTC] Getting webroot for domain='kronos.plan9-dns.com'
[Mon 23 May 2022 12:21:12 AM UTC] Getting webroot for domain='pluton.plan9-dns.com'
[Mon 23 May 2022 12:21:13 AM UTC] Adding txt value: U6PYOBoZGxcq0VKcBsdxjIRB3JxbG75lCDyqWvSHkaM for domain:  _acme-challenge.plan9-dns.com
[Mon 23 May 2022 12:21:14 AM UTC] The txt record is added: Success.
[Mon 23 May 2022 12:21:14 AM UTC] Adding txt value: xiI-93189RwTKB6fwfBsro5OEKVJwn-Wjv3BhBuCgnk for domain:  _acme-challenge.helios.plan9-dns.com
[Mon 23 May 2022 12:21:15 AM UTC] The txt record is added: Success.
[Mon 23 May 2022 12:21:15 AM UTC] Adding txt value: GYy4i_zicYl8_pv6BiG6H3c33ebnmDqoY3KajttoU-E for domain:  _acme-challenge.kronos.plan9-dns.com
[Mon 23 May 2022 12:21:16 AM UTC] The txt record is added: Success.
[Mon 23 May 2022 12:21:16 AM UTC] Adding txt value: usrKLrp4TjJ7hEitOjdFsHwcn7WCQfqvUTcJF2FnTtA for domain:  _acme-challenge.pluton.plan9-dns.com
[Mon 23 May 2022 12:21:18 AM UTC] The txt record is added: Success.
[Mon 23 May 2022 12:21:18 AM UTC] Let's check each DNS record now. Sleep 20 seconds first.
[Mon 23 May 2022 12:21:39 AM UTC] You can use '--dnssleep' to disable public dns checks.
[Mon 23 May 2022 12:21:39 AM UTC] See: https://github.com/acmesh-official/acme.sh/wiki/dnscheck
[Mon 23 May 2022 12:21:39 AM UTC] Checking plan9-dns.com for _acme-challenge.plan9-dns.com
[Mon 23 May 2022 12:21:39 AM UTC] Domain plan9-dns.com '_acme-challenge.plan9-dns.com' success.
[Mon 23 May 2022 12:21:39 AM UTC] Checking helios.plan9-dns.com for _acme-challenge.helios.plan9-dns.com
[Mon 23 May 2022 12:21:39 AM UTC] Domain helios.plan9-dns.com '_acme-challenge.helios.plan9-dns.com' success.
[Mon 23 May 2022 12:21:39 AM UTC] Checking kronos.plan9-dns.com for _acme-challenge.kronos.plan9-dns.com
[Mon 23 May 2022 12:21:39 AM UTC] Domain kronos.plan9-dns.com '_acme-challenge.kronos.plan9-dns.com' success.
[Mon 23 May 2022 12:21:39 AM UTC] Checking pluton.plan9-dns.com for _acme-challenge.pluton.plan9-dns.com
[Mon 23 May 2022 12:21:40 AM UTC] Domain pluton.plan9-dns.com '_acme-challenge.pluton.plan9-dns.com' success.
[Mon 23 May 2022 12:21:40 AM UTC] All success, let's return
[Mon 23 May 2022 12:21:40 AM UTC] Verifying: plan9-dns.com
[Mon 23 May 2022 12:21:40 AM UTC] Processing, The CA is processing your order, please just wait. (1/30)
[Mon 23 May 2022 12:21:50 AM UTC] Success
[Mon 23 May 2022 12:21:50 AM UTC] Verifying: helios.plan9-dns.com
[Mon 23 May 2022 12:21:57 AM UTC] Processing, The CA is processing your order, please just wait. (1/30)
[Mon 23 May 2022 12:22:06 AM UTC] Success
[Mon 23 May 2022 12:22:06 AM UTC] Verifying: kronos.plan9-dns.com
[Mon 23 May 2022 12:22:12 AM UTC] Processing, The CA is processing your order, please just wait. (1/30)
[Mon 23 May 2022 12:22:21 AM UTC] Success
[Mon 23 May 2022 12:22:21 AM UTC] Verifying: pluton.plan9-dns.com
[Mon 23 May 2022 12:22:26 AM UTC] Processing, The CA is processing your order, please just wait. (1/30)
[Mon 23 May 2022 12:22:35 AM UTC] Success
[Mon 23 May 2022 12:22:35 AM UTC] Removing DNS records.
[Mon 23 May 2022 12:22:35 AM UTC] Removing txt: U6PYOBoZGxcq0VKcBsdxjIRB3JxbG75lCDyqWvSHkaM for domain: _acme-challenge.plan9-dns.com
[Mon 23 May 2022 12:22:36 AM UTC] Removed: Success
[Mon 23 May 2022 12:22:36 AM UTC] Removing txt: xiI-93189RwTKB6fwfBsro5OEKVJwn-Wjv3BhBuCgnk for domain: _acme-challenge.helios.plan9-dns.com
[Mon 23 May 2022 12:22:38 AM UTC] Removed: Success
[Mon 23 May 2022 12:22:38 AM UTC] Removing txt: GYy4i_zicYl8_pv6BiG6H3c33ebnmDqoY3KajttoU-E for domain: _acme-challenge.kronos.plan9-dns.com
[Mon 23 May 2022 12:22:39 AM UTC] Removed: Success
[Mon 23 May 2022 12:22:39 AM UTC] Removing txt: usrKLrp4TjJ7hEitOjdFsHwcn7WCQfqvUTcJF2FnTtA for domain: _acme-challenge.pluton.plan9-dns.com
[Mon 23 May 2022 12:22:40 AM UTC] Removed: Success
[Mon 23 May 2022 12:22:40 AM UTC] Verify finished, start to sign.
[Mon 23 May 2022 12:22:40 AM UTC] Lets finalize the order.
[Mon 23 May 2022 12:22:40 AM UTC] Le_OrderFinalize='https://acme.zerossl.com/v2/DV90/order/QURSqgRO9TMTAlmE3-RYxg/finalize'
[Mon 23 May 2022 12:22:46 AM UTC] Order status is processing, lets sleep and retry.
[Mon 23 May 2022 12:22:46 AM UTC] Retry after: 15
[Mon 23 May 2022 12:23:02 AM UTC] Polling order status: https://acme.zerossl.com/v2/DV90/order/QURSqgRO9TMTAlmE3-RYxg
[Mon 23 May 2022 12:23:11 AM UTC] Downloading cert.
[Mon 23 May 2022 12:23:11 AM UTC] Le_LinkCert='https://acme.zerossl.com/v2/DV90/cert/lTe4dAPsUGBzrD4SWAMqUQ'
[Mon 23 May 2022 12:23:17 AM UTC] Cert success.
-----BEGIN CERTIFICATE-----
MIIEQTCCA8agAwIBAgIRAJTckm4rioFHWM9BWJxb0YgwCgYIKoZIzj0EAwMwSzEL
...
...
...
qZcJgOMuYw9MK6olHkascVZPD59NU+aN0VzahU4jANhaRLa4CA==
-----END CERTIFICATE-----
[Mon 23 May 2022 12:23:17 AM UTC] Your cert is in: /root/.acme.sh/plan9-dns.com_ecc/plan9-dns.com.cer
[Mon 23 May 2022 12:23:17 AM UTC] Your cert key is in: /root/.acme.sh/plan9-dns.com_ecc/plan9-dns.com.key
[Mon 23 May 2022 12:23:17 AM UTC] The intermediate CA cert is in: /root/.acme.sh/plan9-dns.com_ecc/ca.cer
[Mon 23 May 2022 12:23:17 AM UTC] And the full chain certs is there: /root/.acme.sh/plan9-dns.com_ecc/fullchain.cer
```
### make directories and install certs
```sh
mkdir -p /etc/zerossl/plan9-dns.com_ecc/
chown -R knot-resolver: /etc/zerossl 
```
```sh
acme.sh --install-cert -d plan9-dns.com --ecc \
        --cert-file /etc/zerossl/plan9-dns.com_ecc/cert.pem \
        --key-file /etc/zerossl/plan9-dns.com_ecc/private.key \
        --fullchain-file /etc/zerossl/plan9-dns.com_ecc/fullchain.pem \
        --reloadcmd "systemctl restart kresd@1.service"

[Mon 23 May 2022 12:36:55 AM UTC] Installing cert to: /etc/zerossl/plan9-dns.com_ecc/cert.pem
[Mon 23 May 2022 12:36:55 AM UTC] Installing key to: /etc/zerossl/plan9-dns.com_ecc/private.key
[Mon 23 May 2022 12:36:55 AM UTC] Installing full chain to: /etc/zerossl/plan9-dns.com_ecc/fullchain.pem
[Mon 23 May 2022 12:36:55 AM UTC] Run reload cmd: systemctl restart kresd@1.service
[Mon 23 May 2022 12:36:55 AM UTC] Reload success
```
