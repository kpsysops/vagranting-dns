# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "dns" do |nginx|
        nginx.vm.hostname = "dns.example.com"
        nginx.vm.box = "generic/centos7"
        nginx.vm.network "private_network", ip: "10.10.10.2"
        nginx.vm.provision "shell", path: ./setupDns.sh
        nginx.vm.provider "virtualbox" do |vb|
            vb.cpus = "1"
            vb.memory = "1024"
            vb.customize ["modifyvm", :id, "--groups", "/vagranting"]
            vb.name = "dns"
        end
    end
end

