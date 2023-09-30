Install Prometheus on Debian Buster

https://prometheus.io/download/

download and extract prometheus
```sh
# wget "copy link to newest version"
# tar xvf prometheus-x.x.x.linux-amd64.tar.gz
# cd prometheus-x.x.x.linux-amd64/
```
add prometheus user and group
```sh
# useradd --system --no-create-home --home /nonexistent --shell=/usr/sbin/nologin prometheus
# id prometheus
uid=999(prometheus) gid=999(prometheus) groups=999(prometheus)

# grep prometheus /etc/group
prometheus:x:999:
```
copy configuration and data file to created directories 
```sh
# mkdir -p /etc/prometheus/{rules,rules.d,files_sd}  /var/lib/prometheus

# cp prometheus promtool /usr/local/bin/
# ls /usr/local/bin/
prometheus promtool

# cp -r consoles/ console_libraries/ /etc/prometheus/
```

create systemd unit file
```sh
# cat /lib/systemd/system/prometheus.service

[Unit]
Description=Prometheus systemd service unit
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=prometheus
Group=prometheus
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/prometheus \
--config.file=/etc/prometheus/prometheus.yml \
--storage.tsdb.path=/var/lib/prometheus \
--web.console.templates=/etc/prometheus/consoles \
--web.console.libraries=/etc/prometheus/console_libraries \
--web.listen-address=0.0.0.0:9090

SyslogIdentifier=prometheus
Restart=always

[Install]
WantedBy=multi-user.target
```

create configuration file
```sh
# cat prometheus.yml 
# Global config
global:
  scrape_interval:     15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).

# Alertmanager configuration
alerting:
  alertmanagers:
  - static_configs:
    - targets:
      # - alertmanager:9093

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  # - "first_rules.yml"
  # - "second_rules.yml"

# A scrape configuration containing exactly one endpoint to scrape:
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.

  - job_name: 'node'
    static_configs:
    - targets: ['127.0.0.1:9100']
```

fix permissions
```sh
# chown -R prometheus:prometheus /etc/prometheus/  /var/lib/prometheus/
# chmod -R 775 /etc/prometheus/ /var/lib/prometheus/
```

start and enable prometheus systemd service
```sh
# systemctl start prometheus
# systemctl enable prometheus
Created symlink from /etc/systemd/system/multi-user.target.wants/prometheus.service to /etc/systemd/system/prometheus.service.
```
check status
```sh
# systemctl status prometheus
● prometheus.service - Prometheus systemd service unit
   Loaded: loaded (/lib/systemd/system/prometheus.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2020-08-18 01:24:21 UTC; 2 months 10 days ago
 Main PID: 21358 (prometheus)
    Tasks: 8 (limit: 1149)
   Memory: 72.4M
   CGroup: /system.slice/prometheus.service
           └─21358 /usr/local/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/var/lib/prometheus --web.console.templates=/etc/prometheus/consoles --web.console.libraries=/etc/prometheus/console_libraries --web.listen-address=0.0.0.0:9090
```
