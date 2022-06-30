```bash

-- SPDX-License-Identifier: CC0-1.0
-- vim:syntax=lua:set ts=4 sw=4:
-- Refer to manual: https://knot-resolver.readthedocs.org/en/stable/

-- Network interface configuration
net.listen('127.0.0.1', 53, { kind = 'dns' })
net.listen('216.238.80.219', 853, { kind = 'tls' })
net.listen('::1', 53, { kind = 'dns', freebind = true })
net.listen('2001:19f0:b400:17d1:5400:4ff:fe00:1267', 853, { kind = 'tls', freebind = true })
net.listen('127.0.0.1', 8453, { kind = 'webmgmt' })
net.tls("/etc/zerossl/plan9-dns.com_ecc/fullchain.pem", "/etc/zerossl/plan9-dns.com_ecc/private.key")

-- Load useful modules
modules = {
	'hints > iterate',  -- Allow loading /etc/hosts or custom root hints
	'stats',            -- Track internal statistics
	'predict',          -- Prefetch expiring/frequent records
        'http',             -- Expose Metrics endpoint for prometheus
        'daf',              -- DNS Application Firewall
}

-- prefill root zone data - domain must be DNSSEC secured
modules.load('prefill')
prefill.config({
      ['.'] = {
              url = 'https://www.internic.net/domain/root.zone',
              interval = 86400,
              ca_file = '/etc/ssl/certs/ca-certificates.crt',
      }
})

-- serve timed-out records
modules = { 'serve_stale < cache' }

-- predict config (period = 0 disables)
predict.config({ window = 15, period = 0})

-- http config for prometheus
http.config({ tls = false, })
http.prometheus.namespace = 'resolver_'

-- daf ruleset Block all queries with QNAME = example.com
-- list active rules > daf.rules
-- add rule $ curl -s -X POST -d "qname ~ %w+.xinxindm.com deny" http://localhost:8453/daf | jq .
-- del rule $ curl -s -X DELETE http://localhost:8453/daf/11 | jq .
-- daf.add('qname ~ %w+.example.com deny')

-- Cache size for tmpfs (requires tmpfs add to fstab)
-- tmpfs /var/cache/knot-resolver tmpfs rw,size=250M,uid=knot-resolver,gid=knot-resolver,nosuid,nodev,noexec,mode=0700 0 0
cache.size = cache.fssize() - 10*MB

-- Disallow ANY queries
policy.add(function (req, query)
       if query.stype == kres.type.ANY then
         return policy.DROP
       end
end)

-- refuse bad actors
-- policy.add(policy.pattern(policy.NO_ANSWER, todname('%w+.example.com.')))
-- policy.add(policy.suffix(policy.NO_ANSWER, policy.todnames({'example.com.'})))

-- rpz deny
policy.add(policy.rpz(policy.DENY_MSG('domain blocked'), '/etc/knot-resolver/blocklist.rpz', true))


-- cdc.gov broken DNSSEC
trust_anchors.set_insecure{'cdc.gov'}

```
