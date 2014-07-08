# -*- mode: ruby -*-
# vi: set ft=ruby :

projectname = 'symfonyproject'

def Kernel.is_windows?
    processor, platform, *rest = RUBY_PLATFORM.split("-")
    platform == 'mingw32'
end

Vagrant.configure("2") do |config|
  config.vm.hostname = projectname
  config.vm.box = "ubuntu/trusty64"
  #config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
  config.vm.network :private_network, ip: "199.199.199.10"

  config.vm.synced_folder "./", "/var/www/" + projectname + "/current", type: "nfs"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
  end

  config.ssh.forward_agent = true

  # Ansible
#  config.vm.provision "ansible" do |ansible|
#    ansible.sudo = true
#    ansible.playbook = "provisioning/site.yml"
#    ansible.verbose = "v"
#  end
end
