Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  #12
  config.vm.define "www2" do |www2|
    www2.vm.hostname = "www2.test.kikitux.net"
    www2.vm.network "private_network", ip: "192.168.56.12"
    www2.vm.provision "shell", path: "scripts/www2.sh", run: "always"
    www2.vm.provision "shell", path: "scripts/nginx.sh", run: "always"
  end

  #11
  config.vm.define "www1" do |www1|
    www1.vm.hostname = "www1.test.kikitux.net"
    www1.vm.network "private_network", ip: "192.168.56.11"
    www1.vm.provision "shell", path: "scripts/www1.sh", run: "always"
    www1.vm.provision "shell", path: "scripts/nginx.sh", run: "always"
  end

  #10
  config.vm.define "proxy" do |proxy|
    proxy.vm.hostname = "proxy.test.kikitux.net"
    proxy.vm.network "private_network", ip: "192.168.56.10"
    proxy.vm.provision "shell", path: "scripts/proxy.sh"
  end

  #9
  config.vm.define "client" do |client|
    client.vm.hostname = "client.test.kikitux.net"
    client.vm.network "private_network", ip: "192.168.56.9"
    client.vm.provision "shell", path: "scripts/client.sh"
  end
  
end
