--[[
dnsdist config v2.0.0 alpha1 testing 04/21/2025
removed dnscrypt due to cert-rotation error
using jedisct1 https://github.com/DNSCrypt/encrypted-dns-server
initial setup - jlong 08/27/2022
  mkdir /var/lib/dnsdist
  chown -R _dnsdist: /var/lib/dnsdist
  edit local fullchain and local privkey
]]

-- path to SSL certs
local fullchain = "/etc/zerossl/plan9dns.com_ecc/fullchain.pem"
local privkey = "/etc/zerossl/plan9dns.com_ecc/private.key"

setLocal("127.0.0.1:5353")
addLocal('[::1]:5353')
setACL({'0.0.0.0/0', '::/0'})
SetDisableECSAction()
setMaxTCPConnectionsPerClient(25)
includeDirectory('/etc/dnsdist/conf.d/')

-- add DoH, DoT, DNSCrypt resolvers
addDOHLocal("0.0.0.0", fullchain, privkey, "/dns-query",{
  reusePort=true,
  minTLSVersion='tls1.3',
  idleTimeout=30,
  numberOfStoredSessions=0,
  customResponseHeaders={["alt-svc"]="h3=\":443\""}})

addDOHLocal("[::]", fullchain, privkey, "/dns-query",{
  reusePort=true,
  minTLSVersion='tls1.3',
  idleTimeout=30,
  numberOfStoredSessions=0,
  customResponseHeaders={["alt-svc"]="h3=\":443\""}})

addDOH3Local("0.0.0.0", fullchain, privkey,{
  reusePort=true,
  idleTimeout=5,
  congestionControlAlgo="bbr"})

addDOH3Local("[::]", fullchain, privkey,{
  reusePort=true,
  idleTimeout=5,
  congestionControlAlgo="bbr"})

addTLSLocal("0.0.0.0", fullchain, privkey,{
  reusePort=true,
  numberOfStoredSessions=0,
  minTLSVersion='tls1.3'})

addTLSLocal("[::]",  fullchain, privkey,{
  reusePort=true,
  numberOfStoredSessions=0,
  minTLSVersion='tls1.3'})

addDOQLocal("0.0.0.0", fullchain, privkey,{
  reusePort=true,
  idleTimeout=5,
  congestionControlAlgo="bbr"})

addDOQLocal("[::]", fullchain, privkey,{
  reusePort=true,
  idleTimeout=5,
  congestionControlAlgo="bbr"})

-- downstream resolvers
-- pdns-recursor
newServer({address="127.0.0.1:53", name="pdns-recursor", qps=0, pool=""})

pc = newPacketCache(250000,{
  maxTTL=86400,
  minTTL=0,
  temporaryFailureTTL=60,
  staleTTL=60,
  dontAge=false,
  parseECS=true})

getPool(""):setCache(pc)

-- Quad9
newServer({address="149.112.112.112", name="Quad9", qps=15, pool="abuse",
healthCheckMode='lazy',
checkInterval=1,
lazyHealthCheckFailedInterval=30,
rise=2,
maxCheckFailures=3,
lazyHealthCheckThreshold=30,
lazyHealthCheckSampleSize=100,
lazyHealthCheckMinSampleCount=10,
lazyHealthCheckMode='TimeoutOnly'})

-- OpenDNS
newServer({address="204.194.232.200", name="openDNS", qps=15, pool="abuse",
healthCheckMode='lazy',
checkInterval=1,
lazyHealthCheckFailedInterval=30,
rise=2,
maxCheckFailures=3,
lazyHealthCheckThreshold=30,
lazyHealthCheckSampleSize=100,
lazyHealthCheckMinSampleCount=10,
lazyHealthCheckMode='TimeoutOnly'})

-- Level3
newServer({address="209.244.0.3", name="level3", qps=15, pool="abuse",
healthCheckMode='lazy',
checkInterval=1,
lazyHealthCheckFailedInterval=30,
rise=2,
maxCheckFailures=3,
lazyHealthCheckThreshold=30,
lazyHealthCheckSampleSize=100,
lazyHealthCheckMinSampleCount=10,
lazyHealthCheckMode='TimeoutOnly'})

setPoolServerPolicy(roundrobin, "abuse")

--rules
-- refuse more than one question per query
addAction(NotRule(RecordsCountRule(DNSSection.Question, 1, 1)),
  SetTagAction("one-question-rule", "match"), {
  name="tag !oneQuestion"})

--[[ (uncomment to test rule)
addAction(TagRule("one-question-rule", "match"),
  LogAction('/var/lib/dnsdist/oneQuestion.log', false, true, true, true, true), {
  name="log !oneQuestion"})
]]

addAction(TagRule("one-question-rule", "match"),
  RCodeAction( DNSRCode.REFUSED), {
  name="refuse !oneQuestion"})

-- spoof ANY TCP
addAction(AndRule({QTypeRule(DNSQType.ANY), TCPRule(true)}),
  SpoofRawAction("\007rfc\056\052\056\050\000", {typeForAny=DNSQType.HINFO }), {
  name="spoof ANY TCP"})

-- drop ANY UDP
addAction(AndRule({QTypeRule(DNSQType.ANY), TCPRule(false)}),
  DropAction(), {
  name="drop ANY UDP"})

-- drop RFC1918 PTR
local smn = newSuffixMatchNode()
smn:add("168.192.in-addr.arpa.")
smn:add("10.in-addr.arpa.")
smn:add("16.172.in-addr.arpa.")
smn:add("17.172.in-addr.arpa.")
smn:add("18.172.in-addr.arpa.")
smn:add("19.172.in-addr.arpa.")
smn:add("20.172.in-addr.arpa.")
smn:add("21.172.in-addr.arpa.")
smn:add("22.172.in-addr.arpa.")
smn:add("23.172.in-addr.arpa.")
smn:add("24.172.in-addr.arpa.")
smn:add("25.172.in-addr.arpa.")
smn:add("26.172.in-addr.arpa.")
smn:add("27.172.in-addr.arpa.")
smn:add("28.172.in-addr.arpa.")
smn:add("29.172.in-addr.arpa.")
smn:add("30.172.in-addr.arpa.")
smn:add("31.172.in-addr.arpa.")
addAction(AndRule({SuffixMatchNodeRule(smn), QTypeRule(DNSQType.PTR)}),
  SetTagAction("smn-rule", "match"), {
  name="tag smn"})

addAction(TagRule("smn-rule", "match"),
  DropAction(),{
  name="drop smn"})

-- drop maxQueries excluding !ip masks
maxQueries=newNMG()
maxQueries:addMask('0.0.0.0/0')
maxQueries:addMask('!111.222.333.444/32')
maxQueries:addMask('::/0')
maxQueries:addMask('!2030:fff:aaa:dddd:dead:beef:bbbb:cccc/128')
addAction(AndRule({NetmaskGroupRule(maxQueries, true), MaxQPSIPRule(75)}),
  SetTagAction("max-queries-rule", "match"), {
  name="tag maxQueries"})

addAction(TagRule("max-queries-rule", "match"),
  DropAction(), {
  name="drop maxQueries"})

-- dynBlocks
local dbr = dynBlockRulesGroup()
dbr:excludeRange({
  "127.0.0.1/32",
  "111.222.333.444/32",
  "::1/128",
  "2030:fff:aaa:dddd:dead:beef:bbbb:cccc/128"})
dbr:setQueryRate(155, 10, "Exceeded Query rate", 75, DNSAction.Drop)
dbr:setRCodeRate(DNSRCode.NXDOMAIN, 20, 10, "Exceeded NXD rate", 60, DNSAction.Drop)
dbr:setRCodeRate(DNSRCode.SERVFAIL, 20, 10, "Exceeded ServFail rate", 60, DNSAction.Drop)
dbr:setQTypeRate(DNSQType.ANY, 10, 10, "Exceeded ANY rate", 60, DNSAction.Drop)
dbr:setQTypeRate(DNSQType.TXT, 10, 10, "Exceeded TXT rate", 60, DNSAction.Drop)
dbr:setQTypeRate(DNSQType.PTR, 20, 10, "Exceeded PTR rate", 60, DNSAction.Drop)
dbr:setQTypeRate(DNSQType.NS, 20, 10, "Exceeded NS rate", 60, DNSAction.Drop)
dbr:setQTypeRate(DNSQType.DS, 20, 10, "Exceeded DS rate", 60, DNSAction.Drop)
dbr:setQTypeRate(DNSQType.HTTPS, 20, 10, "Exceeded HTTPS rate", 60, DNSAction.Drop)

function maintenance()
  dbr:apply()
end

-- enable local control socket, generate key with makeKey()
controlSocket('127.0.0.1:5199')
setKey("key=")

webserver("0.0.0.0:8083")
setWebserverConfig({password=("$scrypt$ln=10,p=1,r=8$password="),
  apiKey=("$scrypt$ln=10,p=1,r=8$apiKey="),
  acl="0.0.0.0/0"})
