
cpus           = ENV['CPUS'] || 12
memory         = ENV['MEMORY'] || 10024

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/lunar64"
  
    config.vm.provider "virtualbox" do |vb|
      vb.memory = memory # Need to up the size or vboxmanage return an error
      vb.cpus = cpus
    end
  
    # Provisioning with a shell script
    config.vm.provision "shell", privileged: true, path: "./scripts/setup.sh"
  end
