# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "dns" do |dns|
        dns.vm.hostname = "dns.example.com"
        dns.vm.box = "generic/centos7"
        dns.vm.network "private_network", ip: "10.10.10.2"
        dns.vm.provision "shell", path: "setupDns.sh"
        dns.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
        dns.vm.provider "virtualbox" do |vb|
            vb.cpus = "1"
            vb.memory = "512"
            vb.customize ["modifyvm", :id, "--groups", "/vagranting"]
            vb.name = "dns"
        end
    end
end

