Install grafana on Debian Buster

https://grafana.com/grafana/download

Note:\
Install .deb package
If you install the .deb package, then you will need to manually update Grafana for each new version.
I used the open source edition

---sh
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_7.3.0_amd64.deb
sudo dpkg -i grafana_7.3.0_amd64.deb
```



