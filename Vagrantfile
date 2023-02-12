# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |docker|
  docker.vm.box = "shekeriev/centos-stream-9"
  docker.vm.hostname = "docker.martin.bg"
  docker.vm.network "private_network", ip: "192.168.34.100"
  docker.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
  docker.vm.provision "shell", path: "docker.sh"
  docker.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.name = "docker"
  end
  docker.trigger.after :up do |trigger|
    trigger.name = "Open default browser"
    if Vagrant::Util::Platform.windows?
      trigger.run = {inline: "start http://localhost:8080"}
    end
    if Vagrant::Util::Platform.linux?
      trigger.run = {inline: "bash -c 'xdg-open http://localhost:8080'"}
    end
    if Vagrant::Util::Platform.darwin?
      trigger.run = {inline: "open http://localhost:8080"}
    end
  end
end
