# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$packagescript = <<SCRIPT
echo Installing packages
apt-get update
# Basic packages
apt-get install -y g++ make libgmp-dev  m4 git autoconf libtool lcov
# For browse
apt-get install -y libncurses5-dev
# For float
apt-get install -y libfplll-dev libmpfr-dev libmpc-dev libmpfi-dev libsuitesparse-dev
# For linboxing
apt-get install -y libgivaro-dev dpkg-dev liblinbox-dev fflas-ffpack
# For xgap
apt-get install -y libx11-dev libxaw7-dev libxt-dev
# For pargap
apt-get install -y libopenmpi-dev openmpi-bin
# For PolymakeInterface
sudo apt-get install -y ant ant-optional default-jdk g++ libboost-dev libgmp-dev libgmpxx4ldbl libmpfr-dev libperl-dev libsvn-perl libterm-readline-gnu-perl libxml-libxml-perl libxml-libxslt-perl libxml-perl libxml-writer-perl libxml2-dev w3c-dtd-xhtml xsltproc
sudo apt-get install -y clang bliss libbliss-dev
# sudo -u vagrant -i /vagrant/scripts/install-polymake.sh
# Build GAP and packages
sudo -u vagrant -i /vagrant/scripts/setup-gap.sh
sudo -u vagrant /vagrant/scripts/build-covers.sh
SCRIPT


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  
  if Vagrant.has_plugin?("vagrant-cachier")
     config.cache.scope = :box
  end
   
  config.vm.provision "shell", inline:
$packagescript


  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "4096"]
     vb.customize ["modifyvm", :id, "--cpus", "2"]  
   end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

end
