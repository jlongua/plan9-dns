https://www.nxnsattack.com/dns-ns-paper.pdf

Noticed 10 thousand fold increase in NXDOMAIN's \
had to sift through a temp log created by knot-resolver with verbose(true) \
log created was 2GB in size for about 1 hour

suprised to see this:
```sh
May 16 13:42:25 draco kresd[5266]: [00000.05][iter]   <= rcode: REFUSED
May 16 13:42:25 draco kresd[5266]: [00000.00][resl]   => too many failures in a row, bail out (mitigation for NXNSAttack CVE-2020-12667)
May 16 13:42:25 draco kresd[5266]: [00000.00][resl] request failed, answering with empty SERVFAIL
...
May 18 13:11:06 draco kresd[11246]: [00000.00][plan] plan 'algyorap.com.ununtu.' type 'A' uid [53037.00]
May 18 13:11:06 draco kresd[11246]: [53037.00][iter]   'algyorap.com.ununtu.' type 'A' new uid was assigned .01, parent uid .00
May 18 13:11:06 draco kresd[11246]: [53037.01][cach]   => trying zone: ., NSEC, hash 0
May 18 13:11:06 draco kresd[11246]: [53037.01][cach]   => NSEC sname: covered by: uno. -> uol., new TTL 19093
May 18 13:11:06 draco kresd[11246]: [53037.01][cach]   => NSEC wildcard: covered by: . -> aaa., new TTL 85561
May 18 13:11:06 draco kresd[11246]: [53037.01][iter]   <= rcode: NXDOMAIN
May 18 13:11:06 draco kresd[11246]: [53037.01][vldr]   <= answer valid, OK
May 18 13:11:06 draco kresd[11246]: [53037.01][resl]   AD: request classified as SECURE
May 18 13:11:06 draco kresd[11246]: [53037.01][resl]   finished in state: 4, queries: 1, mempool: 49200 B
May 18 13:11:06 draco kresd[11246]: [00000.00][plan] plan 'yaheprap.com.' type 'A' uid [16363.00]
May 18 13:11:06 draco kresd[11246]: [16363.00][iter]   'yaheprap.com.' type 'A' new uid was assigned .01, parent uid .00
May 18 13:11:06 draco kresd[11246]: [16363.01][cach]   => no NSEC* cached for zone: com.
May 18 13:11:06 draco kresd[11246]: [16363.01][cach]   => skipping zone: com., NSEC, hash 0;new TTL -123456789, ret -2
May 18 13:11:06 draco kresd[11246]: [16363.01][cach]   => skipping zone: com., NSEC, hash 0;new TTL -123456789, ret -2
May 18 13:11:06 draco kresd[11246]: [16363.01][zcut]   found cut: com. (rank 040 return codes: DS 0, DNSKEY 0)
May 18 13:11:06 draco kresd[11246]: [16363.01][slct]   => id: '17895' choosing: 'b.gtld-servers.net.'@'192.33.14.30#00053' with timeout 47 ms zone cut: 'com.'
May 18 13:11:06 draco kresd[11246]: [16363.01][resl]   => id: '17895' querying: 'b.gtld-servers.net.'@'192.33.14.30#00053' zone cut: 'com.' qname: 'yahepRAP.COM.' qtype: 'A' proto: 'udp'
May 18 13:11:06 draco kresd[11246]: [00000.00][plan] plan 'spxhprap.com.ununtu.' type 'AAAA' uid [43146.00]
May 18 13:11:06 draco kresd[11246]: [43146.00][iter]   'spxhprap.com.ununtu.' type 'AAAA' new uid was assigned .01, parent uid .00
May 18 13:11:06 draco kresd[11246]: [43146.01][cach]   => trying zone: ., NSEC, hash 0
May 18 13:11:06 draco kresd[11246]: [43146.01][cach]   => NSEC sname: covered by: uno. -> uol., new TTL 19093
May 18 13:11:06 draco kresd[11246]: [43146.01][cach]   => NSEC wildcard: covered by: . -> aaa., new TTL 85561
May 18 13:11:06 draco kresd[11246]: [43146.01][iter]   <= rcode: NXDOMAIN
May 18 13:11:06 draco kresd[11246]: [43146.01][vldr]   <= answer valid, OK
May 18 13:11:06 draco kresd[11246]: [43146.01][resl]   AD: request classified as SECURE
May 18 13:11:06 draco kresd[11246]: [43146.01][resl]   finished in state: 4, queries: 1, mempool: 49200 B
May 18 13:11:06 draco kresd[11246]: [gnutls] (3) ASSERT: ../../lib/buffers.c[get_last_packet]:1171
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: SSL 3.3 ChangeCipherSpec packet received. Epoch 1, length: 1
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: Expected Packet Handshake(22)
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: Received Packet ChangeCipherSpec(20) with length: 1
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: SSL 3.3 Application Data packet received. Epoch 1, length: 53
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: Expected Packet Handshake(22)
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: Received Packet Application Data(23) with length: 53
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: Decrypted Packet[0] Handshake(22) with length: 36
May 18 13:11:06 draco kresd[11246]: [gnutls] (4) HSK[0xb002c30]: FINISHED (20) was received. Length 32[32], frag offset 0, frag length: 32, sequence: 0
May 18 13:11:06 draco kresd[11246]: [gnutls] (4) HSK[0xb002c30]: parsing finished
May 18 13:11:06 draco kresd[11246]: [gnutls] (4) HSK[0xb002c30]: TLS 1.3 set read key with cipher suite: GNUTLS_AES_128_GCM_SHA256
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: Start of epoch cleanup
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: Epoch #0 freed
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: Epoch #1 freed
May 18 13:11:06 draco kresd[11246]: [gnutls] (5) REC[0xb002c30]: End of epoch cleanup
```
and so on....

the 'mitigation' apparently works with aggressive caching and I haven't noticed any server degradation.
even with the logs, it is very difficult to see where the attack is originating

Ok, was able to find the offender...
looked for ip with excess connections with netstat
```sh
netstat -tulpna
```
also  took a temp log snipet and did
```sh
cat syslog.nz1 | grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | sort | uniq -c | sort | lnav
```
deleted temp log when done. \
offender ip neutralized with ipset block \
actually went overboard and blocked entire cidr
