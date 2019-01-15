Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    vb.default_nic_type = "virtio"
  end

  config.vm.provision "shell" do |s|
    s.path = "./provision.sh"
  end
end
