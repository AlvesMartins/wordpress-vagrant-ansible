# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.define "db" do |wordpress_m1|
    wordpress_m1.vm.hostname = "ansibleDB.maquina1"
    wordpress_m1.vm.box = "ubuntu/trusty64"
    wordpress_m1.vm.network "forwarded_port", guest: 80, host:8181
#   wordpress_m1.vm.network "public_network", bridge: "wlp4s0"
#    wordpress_m1.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
    wordpress_m1.vm.provider "virtualbox" do |virtualbox|
      virtualbox.customize [ "modifyvm", :id, "--cpus", "1" ]
      virtualbox.customize [ "modifyvm", :id, "--memory", "2024" ]
      #virtualbox.customize [ "modifyhd", :id, "--resize", "10000"]
    end

  end
 
#  config.vm.define "app" do |wordpress_m2|
#    wordpress_m2.vm.hostname = "ansibleWP.maquina2"
#    wordpress_m2.vm.box = "ubuntu/trusty64"
#    wordpress_m2.vm.network "forwarded_port", guest: 80, host:8181
#    wordpress_m2.vm.network "public_network", bridge: "wlp4s0"
#    wordpress_m2.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
#   wordpress_m2.vm.provider "virtualbox2" do |virtualbox2|
#      virtualbox2.customize [ "modifyvm", :id, "--cpus", "1" ]
#      virtualbox2.customize [ "modifyvm", :id, "--memory", "2024" ]
      #virtualbox2.customize [ "modifyhd", :id, "--resize", "10000"]


#   end

   config.vm.provision "ansible" do |ansible|
     ansible.playbook = "site.yml"
     ansible.verbose = "vv"
     ansible.sudo = true
     ansible.groups = {
       "dbservers" => ["db"],
       "webservers" => ["db"],
 
     } 
     
   end

end
  
  

