### kresd.conf
- add modules 'stats' and 'http'
```sh
net.listen('127.0.0.1', 8453, { kind = 'webmgmt' })

modules = {
    'hints > iterate',  -- Load /etc/hosts and allow custom root hints

    'stats',            -- Track internal statistics

    'predict',          -- Prefetch expiring/frequent records

    'http',             -- Expose Metrics endpoint for prometheus
}

modules.load('prefill')
prefill.config({
      ['.'] = {
              url = 'https://www.internic.net/domain/root.zone',
              interval = 86400 -- seconds
      }
})

modules = { 'serve_stale < cache' }

http.config({ tls = false, })
http.prometheus.namespace = 'resolver_'

-- Cache size
cache.size = 400 * MB

-- cdc.gov broken DNSSEC
trust_anchors.set_insecure{'cdc.gov'}

```

### prometheus.yml
- add job 'knot'
```sh
- job_name: 'knot'
    static_configs:
    - targets: ['127.0.0.1:8453']
```

### grafana dashboard knot-resolver
- [dashboard](https://grafana.com/grafana/dashboards/12743)
