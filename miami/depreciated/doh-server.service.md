```sh
[Unit]
Description=doh-server
Documentation=https://github.com/DNSCrypt/doh-server
Wants=network-online.target
After=network-online.target
 
[Service]
Type=simple
ExecStart=/usr/bin/doh-proxy \
--tls-cert-path /etc/zerossl/plan9-dns.com_ecc/fullchain-doh.pem \
--tls-cert-key-path /etc/zerossl/plan9-dns.com_ecc/pkey-pkcs8.pem \
--hostname pluton.plan9-dns.com \
--listen-address 127.0.0.1:3000 \
--public-address 149.28.101.119 \
--server-address 127.0.0.1:53
# --max-clients <max_clients>          Maximum number of simultaneous clients [default: 512]
# --max-concurrent <max_concurrent>    Maximum number of concurrent requests per client [default: 16]

Restart=always

[Install]
WantedBy=multi-user.target
```