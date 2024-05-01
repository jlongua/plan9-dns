Running china-update.sh will generate and place china.conf into /etc/dnsdist/conf.d
```sh
local china = {
    ipv4 = {
      "1.0.1.0/24",
      "1.0.2.0/23",
      "1.0.8.0/21",
      "1.0.32.0/19",
... showing partial list
      "223.254.0.0/16",
      "223.255.0.0/17",
      "223.255.236.0/22",
      "223.255.252.0/23"
    },
    ipv6 = {
      "2001:250::/30",
      "2001:254::/31",
      "2001:256::/32",
      "2001:67c:a1c::/48",
... showing partial list
      "2a0a:2840::/29",
      "2a0e:7580::/29",
      "2a13:1800::/29",
      "2a13:8b40::/29"
    }
}
local china_maxQ = newNMG()

for _, segment in ipairs(china["ipv4"]) do
   china_maxQ:addMask(segment)
end

for _, segment in ipairs(china["ipv6"]) do
   china_maxQ:addMask(segment)
end

addAction(
    AndRule({
        NetmaskGroupRule(china_maxQ, true),
        MaxQPSIPRule(5)}),
    SetTagAction(
        "china-maxQ-rule", "match"),{
            name="tag china_maxQ"
    }
)

addAction(
    TagRule(
        "china-maxQ-rule", "match"),
    DropAction(),{
    name="drop china-maxQ"
    }
)
```
