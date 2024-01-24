sudo -i
cp /vagrant/grafana-enterprise-10.3.1-1.x86_64.rpm /root/
yum -y install /root/grafana-enterprise-10.3.1-1.x86_64.rpm
systemctl daemon-reload
systemctl start grafana-server

