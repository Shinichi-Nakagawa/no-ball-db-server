# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.ssh.forward_agent = true

end
