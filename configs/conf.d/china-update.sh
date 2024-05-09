#!/bin/bash

wget -w 1 -O china_cidr https://raw.githubusercontent.com/ipverse/rir-ip/master/country/cn/aggregated.json

sleep 2

sed -i 'N;$!P;D' china_cidr  # delete next to last line
sed -i '1,8d' china_cidr # delete lines 1-8
sed -i 's/\[/\{/g' china_cidr # subsitute { for [
sed -i 's/\]/\}/g' china_cidr # substitue } for ]
sed -i 's/"ipv4":/ipv4 =/g' china_cidr # substitute ipv4 = for "ipv4"
sed -i 's/"ipv6":/ipv6 =/g' china_cidr # substitute ipv6 = for "ipv6"
sed -i 's/  "subnets":/local china =/g' china_cidr # substitute local china = for "subnets":
sed -i -e '$a\' china_cidr # add newline at end of file

cat china_rules >> china_cidr

cp china_cidr /etc/dnsdist/conf.d/china.conf
chown _dnsdist: /etc/dnsdist/conf.d/china.conf
