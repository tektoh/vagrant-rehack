# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "CentOS-6.4-x86_64-v20130427"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "yum::epel",
      "yum::remi",
      "selinux::disabled",
      "iptables::disabled",
      "git",
      "mysql::server",
      "mysql::client",
      "php",
      "apache2",
      "apache2::mod_ssl",
      "memcached",
      "phpmyadmin",
      "composer",
      "nodejs",
      "webserver"
    ]
    chef.json = {
      mysql: {
        server_root_password: "password",
        server_debian_password: "password",
        server_repl_password: "password",
        bind_address: "127.0.0.1"
      },
      phpmyadmin: {
        blowfish_secret: "blowfish_secret",
        fpm: false
     }
    }
  end
end
