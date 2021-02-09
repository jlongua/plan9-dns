### kresd.conf
- add modules 'stats' and 'http'
```sh
net.listen('127.0.0.1', 8453, { kind = 'webmgmt' })

modules = {
    'hints > iterate',  -- Load /etc/hosts and allow custom root hints

    'stats',            -- Track internal statistics

    'predict',          -- Prefetch expiring/frequent records

    'http',
}

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
