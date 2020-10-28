Install Prometheus on Debian Buster

https://linoxide.com/linux-how-to/install-prometheus-ubuntu/

https://prometheus.io/download/

download and extract prometheus
```sh
# wget "copy link to newest version"
# tar xvf prometheus-x.x.x.linux-amd64.tar.gz
# cd prometheus-x.x.x.linux-amd64/
```
add prometheus user and group
```sh
# groupadd --system prometheus
# grep prometheus /etc/group
prometheus:x:999:

# useradd -s /sbin/nologin -r -g prometheus prometheus
# id prometheus
uid=999(prometheus) gid=999(prometheus) groups=999(prometheus)
```
copy configuration and data to created directories 
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
# cat  /etc/prometheus/prometheus.yml
# Global config
global: 
 scrape_interval: 15s # Set the scrape interval to every 15 seconds.
 evaluation_interval: 15s # Evaluate rules every 15 seconds. 
 scrape_timeout: 15s # scrape_timeout is set to the global default (10s).

# A scrape configuration containing exactly one endpoint to scrape:# Here it's Prometheus itself.
scrape_configs:
 # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
 - job_name: 'prometheus'

# metrics_path defaults to '/metrics'
 # scheme defaults to 'http'.

static_configs:
 - targets: ['localhost:9090']
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
```
