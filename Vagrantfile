# -*- mode: ruby -*-
# vi: set ft=ruby :

# TODO: Change the name
projectname = 'projectname'

Vagrant.configure("2") do |config|
  config.vm.hostname = projectname
  config.vm.box = "ubuntu/trusty64"
# TODO: Change the directory
  config.vm.network :private_network, ip: "10.0.0.7"

# TODO: Change the directory
 config.vm.synced_folder "./", "/var/www/" + projectname + "/current", type: "nfs"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
  end

  config.ssh.forward_agent = true

  # Ansible see https://docs.vagrantup.com/v2/provisioning/ansible.html
  config.vm.provision "ansible" do |ansible|
    ansible.sudo = true
    ansible.playbook = "provisioning/playbook.yml"
    ansible.limit = 'vagrant'
    ansible.inventory_path = "provisioning/hosts/vagrant"
    ansible.verbose = "v" #Use vvvv to get more log
  end
end
