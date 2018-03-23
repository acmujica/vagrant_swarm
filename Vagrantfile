# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "start1", primary: true do |start1|
    start1.vm.box = "ubuntu/xenial64"
    start1.vm.synced_folder "./shared", "/shared"
    start1.vm.hostname = "start1"
    start1.vm.network "private_network", ip: "192.168.100.71"
    start1.vm.provider "virtualbox" do |s1|
      s1.name = "start1"
      s1.customize ["modifyvm", :id, "--cableconnected1", "on"]
    end
    start1.vm.provision "shell", path: "provision.sh"
  end
  config.vm.define "start2" do |start2|
    start2.vm.box = "ubuntu/xenial64"
    start2.vm.synced_folder "./shared", "/shared"
    start2.vm.hostname = "start2"
    start2.vm.network "private_network", ip: "192.168.100.72"
    start2.vm.provider "virtualbox" do |s2|
      s2.name = "start2"
      s2.customize ["modifyvm", :id, "--cableconnected1", "on"]
    end
    start2.vm.provision "shell", path: "provision.sh"
  end
  config.vm.define "start3" do |start3|
    start3.vm.box = "ubuntu/xenial64"
    start3.vm.synced_folder "./shared", "/shared"
    start3.vm.hostname = "start3"
    start3.vm.network "private_network", ip: "192.168.100.73"
    start3.vm.provider "virtualbox" do |s3|
      s3.name = "start3"
      s3.customize ["modifyvm", :id, "--cableconnected1", "on"]
    end
    start3.vm.provision "shell", path: "provision.sh"
  end
end