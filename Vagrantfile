# -*- mode: ruby -*-
# vi: set ft=ruby :

# TODO: Change the name
projectname = 'projectname'

def Kernel.is_windows?
    processor, platform, *rest = RUBY_PLATFORM.split("-")
    platform == 'mingw32'
end

Vagrant.configure("2") do |config|
  config.vm.hostname = projectname
  config.vm.box = "ubuntu/trusty64"
# TODO: Change the directory
  config.vm.network :private_network, ip: "199.199.199.10"

# TODO: Change the directory
  config.vm.synced_folder "../" + projectname , "/var/www/" + projectname + "/current", type: "nfs"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
  end

  config.ssh.forward_agent = true

  # Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.sudo = true
    ansible.playbook = "provisioning/site.yml"
    ansible.verbose = "v"
  end
end
