Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    vb.default_nic_type = "virtio"
  end

  config.trigger.before [:up, :provision] do |t|
    t.name = "Anyconnect installer check"
    t.ruby do |env, machine|
      unless Dir.glob("./anyconnect-linux64-*.sh").any?
        puts "Anyconnect installer not found in PWD."
        puts "Please download installer from VPN server and place in current directory"
        abort
      end
    end
  end

  config.vm.provision "shell" do |s|
    s.path = "./provision.sh"
  end
end
