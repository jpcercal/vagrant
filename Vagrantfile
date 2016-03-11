# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest: 3306, host: 3307, auto_correct: true

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.100.100"

  # The settings within config.ssh relate to configuring how Vagrant will
  # access your machine over SSH. As with most Vagrant settings, the defaults
  # are typically fine, but you can fine tune whatever you would like.
  #
  # This sets the username that Vagrant will SSH as by default. Providers are
  # free to override this if they detect a more appropriate user. By default
  # this is "vagrant," since that is what most public boxes are made as.
  config.ssh.username = 'vagrant'
  #
  # config.ssh.password - This sets a password that Vagrant will use to
  # authenticate the SSH user. Note that Vagrant recommends you use key-based
  # authentication rather than a password (see private_key_path) below. If you
  # use a password, Vagrant will automatically insert a keypair if insert_key
  # is true.
  config.ssh.password = 'vagrant'

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./", "/var/www", create: true, owner: "www-data", group: "www-data", type: "nfs", mount_options: ["dmode=777", "fmode=777"]

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider :virtualbox do |vb|
    # Customize the amount of memery and cpu used by VM
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", 50]
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  Vagrant::Config.run do |config|
    # we will try to autodetect this path.
    # However, if we cannot or you have a special one you may pass it like:
    # config.vbguest.iso_path = "#{ENV['HOME']}/Downloads/VBoxGuestAdditions.iso"
    # or an URL:
    # config.vbguest.iso_path = "http://company.server/VirtualBox/%{version}/VBoxGuestAdditions.iso"
    # or relative to the Vagrantfile:
    # config.vbguest.iso_path = File.expand_path("../relative/path/to/VBoxGuestAdditions.iso", __FILE__)

    # set auto_update to false, if you do NOT want to check the correct
    # additions version when booting this machine
    config.vbguest.auto_update = false

    # do NOT download the iso file from a webserver
    config.vbguest.no_remote = true
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision :file, source: "~/.gitconfig", destination: "~/.gitconfig"
  config.vm.provision :file, source: "~/sites-available", destination: "~/sites-available"
  config.vm.provision :shell, path: "install-essentials.sh"
  config.vm.provision :shell, path: "install-npm.sh"
  config.vm.provision :shell, path: "install-php.sh"
  config.vm.provision :shell, path: "install-mysql.sh"
  config.vm.provision :shell, path: "install-apache.sh"
  config.vm.provision :shell, path: "install-wkhtmltopdf.sh"
  config.vm.provision :shell, path: "enable-sites.sh"
  config.vm.provision :shell, path: "finish.sh"
end
