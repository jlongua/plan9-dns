
- [node-exporter download](https://prometheus.io/download)

copy link location and use wget

extract archive
```sh
tar xvzf node_exporter*.tar.gz
```
copy the binary to your /usr/local/bin folder

add system user node_exporter
```sh
useradd --system --no-create-home --home /nonexistent --shell=/usr/sbin/nologin node_exporter
```
check with id node_exporter
```sh
chown node_exporter:node_exporter /usr/local/bin/node_exporter
```
add systemd service
```sh
cat /lib/systemd/system/node_exporter.service

[Unit]
Description=Prometheus Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target

### to change listen address
# postpend --web.listen-address=":9200" to ExecStart=/usr/local/bin/node_exporter
```
start node_exporter
```sh
systemctl daemon-reload
systemctl start node_exporter
systemctl status node_exporter.service
systemctl enable node_exporter
```
check output
```sh
curl http://localhost:9100/metrics
```
