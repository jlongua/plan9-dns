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
              interval = 86400,
              ca_file = '/etc/ssl/certs/ca-certificates.crt',
      }
})

modules = { 'serve_stale < cache' }

http.config({ tls = false, })
http.prometheus.namespace = 'resolver_'
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
