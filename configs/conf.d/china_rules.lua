```sh
local china_maxQ = newNMG()

for _, segment in ipairs(china["ipv4"]) do
   china_maxQ:addMask(segment)
end

for _, segment in ipairs(china["ipv6"]) do
   china_maxQ:addMask(segment)
end

addAction(AndRule({NetmaskGroupRule(china_maxQ, true),MaxQPSIPRule(5)}),
    SetTagAction("china-maxQ-rule", "match"),
    {name="tag china_maxQ"}
)

addAction(TagRule("china-maxQ-rule", "match"),
    DropAction(),
    {name="drop china-maxQ"}
)
```
