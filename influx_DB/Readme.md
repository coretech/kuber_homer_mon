cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF

yum makecache


yum -y install influxdb
systemctl start influxdb && systemctl enable influxdb

nano  /etc/influxdb/influxdb.conf
```
# Determines whether HTTP endpoint is enabled.
  enabled = true
# Determines whether user authentication is enabled over HTTP/HTTPS.
  auth-enabled = true
  ```

# Create user
```
curl -XPOST "http://localhost:8086/query" --data-urlencode \
"q=CREATE USER admin WITH PASSWORD '1cc@syn3rgyb3am' WITH ALL PRIVILEGES"
```

#login
```
influx -username 'admin' -password '1cc@syn3rgyb3am'
```

```
curl -G http://localhost:8086/query -u admin:StrongPassw0rd --data-urlencode "q=SHOW DATABASES"
```
