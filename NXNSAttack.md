Noticed 10 thousand fold increase in NXDOMAIN's 
had to sift through a temp log created by knot-resolver with verbose(true)
log created was 2GB in size for about 1 hour

suprised to see this:
```sh
May 16 13:42:25 draco kresd[5266]: [00000.05][iter]   <= rcode: REFUSED
May 16 13:42:25 draco kresd[5266]: [00000.00][resl]   => too many failures in a row, bail out (mitigation for NXNSAttack CVE-2020-12667)
May 16 13:42:25 draco kresd[5266]: [00000.00][resl] request failed, answering with empty SERVFAIL
...
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'qxflikap.com.' type 'A' uid [00000.00]                                                            │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'npiiikap.com.' type 'AAAA' uid [00000.00]                                                         │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'wmfcjkap.com.' type 'A' uid [00000.00]                                                            │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'wmfcjkap.com.' type 'AAAA' uid [00000.00]                                                         │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'pgqkjkap.com.' type 'A' uid [00000.00]                                                            │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'fusdikap.com.ununtu.' type 'AAAA' uid [00000.00]                                                  │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'fusdikap.com.ununtu.' type 'A' uid [00000.00]                                                     │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'hcnijkap.com.' type 'A' uid [00000.00]                                                            │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'copwikap.com.' type 'A' uid [00000.00]                                                            │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'hcnijkap.com.' type 'AAAA' uid [00000.00]                                                         │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'iimkjkap.com.' type 'A' uid [00000.00]                                                            │
May 16 14:03:06 draco kresd[5266]: [00000.00][plan] plan 'iimkjkap.com.' type 'AAAA' uid
```
and so on....

so apparently the 'mitigation' doesn't work well
even with the logs, it is very difficult to see where the attack is originating

seems to have slowed down and maybe stopped... I did add some blocking policies, and blocked some ip's and cidr's but not sure if that did anything at all.
