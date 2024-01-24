# -*- mode: ruby -*- 222
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 9090, host: 9090
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 9100, host: 9100
  config.vm.network "forwarded_port", guest: 9093, host: 9093
  config.vm.network "private_network", ip: "192.168.56.10"
  # config.vm.provider "virtualbox" do |vb|
  # end
  config.vm.define "prometheus" do |repo|
  config.vm.synced_folder ".", "/vagrant"
  repo.vm.hostname = "prometheus"
  repo.vm.provision "shell", path: "prometheus.sh"
  repo.vm.provision "shell", path: "node_exporter.sh"
  repo.vm.provision "shell", path: "grafana.sh"
  #repo.vm.provision "shell", path: "alertmanager.sh"
  end
 end
