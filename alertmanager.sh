sudo -i
# Скачиваем и распаковываем AlertManager
wget https://github.com/prometheus/alertmanager/releases/download/v0.25.0/alertmanager-0.25.0.linux-amd64.tar.gz
tar zxf alertmanager-0.25.0.linux-amd64.tar.gz
# Создаем пользователя и нужные директории
useradd --no-create-home --shell /bin/false alertmanager
usermod --home /var/lib/alertmanager alertmanager
mkdir /etc/alertmanager
mkdir /var/lib/alertmanager
# Копируем бинарники из архива в /usr/local/bin и меняем владельца
cp alertmanager-0.25.0.linux-amd64/amtool /usr/local/bin/
cp alertmanager-0.25.0.linux-amd64/alertmanager /usr/local/bin/
cp alertmanager-0.25.0.linux-amd64/alertmanager.yml /etc/alertmanager/
chown -R alertmanager:alertmanager /etc/alertmanager /var/lib/alertmanager
chown alertmanager:alertmanager /usr/local/bin/{alertmanager,amtool}
echo "ALERTMANAGER_OPTS=\"\"" > /etc/default/alertmanager
chown alertmanager:alertmanager /etc/default/alertmanager
chown -R alertmanager:alertmanager /var/lib/prometheus/alertmanager
cp /vagrant/alertmanager.service /etc/systemd/system/
# Запускаем сервис
systemctl daemon-reload
systemctl start alertmanager
cp /vagrant/rules.yml /etc/prometheus/
systemctl restart prometheus
systemctl restart alertmanager
