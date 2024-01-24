sudo -i
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar xzfv node_exporter-1.5.0.linux-amd64.tar.gz
# Создаем пользователя, перемещаем бинарник в /usr/local/bin
useradd -rs /bin/false nodeusr
mv node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin/
# Создаем сервис
cp /vagrant/node_exporter.service /etc/systemd/system/
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
systemctl restart prometheus
