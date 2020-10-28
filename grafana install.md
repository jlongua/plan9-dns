Install grafana on Debian Buster

https://grafana.com/grafana/download

Note:\
Install .deb package
If you install the .deb package, then you will need to manually update Grafana for each new version.\
I used the open source edition

```sh
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_7.3.0_amd64.deb
sudo dpkg -i grafana_7.3.0_amd64.deb
```

Start the server
```sh
# systemctl daemon-reload
# systemctl start grafana-server
# systemctl enable grafan-server
```

```sh
Check the status
# systemctl status grafana-server
● grafana-server.service - Grafana instance
   Loaded: loaded (/lib/systemd/system/grafana-server.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2020-08-18 00:42:40 UTC; 2 months 10 days ago
     Docs: http://docs.grafana.org
 Main PID: 21137 (grafana-server)
    Tasks: 12 (limit: 1149)
   Memory: 51.4M
   CGroup: /system.slice/grafana-server.service
           └─21137 /usr/sbin/grafana-server --config=/etc/grafana/grafana.ini --pidfile=/var/run/grafana/grafana-server.pid --packaging=deb cfg:default.paths.logs=/var/log/grafana cfg:default.paths.data=/var/lib/grafana cfg:default.paths.plugins=/var/lib/grafana/plugins cfg:default.paths.provisioning=/etc/grafana/provisioning
```
