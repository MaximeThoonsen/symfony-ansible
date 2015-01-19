symfony-ansible
===============

This repo will provide you an easy set-up for your symfony project.
It provide the Vagrantfile to create your Ubuntu Trusty 64bits VM and it uses Ansible to provision it.
You can also use Ansible to provision your remote server.
I have also added a sample configuration for Capifony; a tool to deploy your code on your server.

TL;DR Ansible to configure your servers/VMs and Capifony to deploy the code on your servers.

I have made a basic Ansible provisioning that will be sufficient to run symfony but you need to customize it a bit more.
If so you should have a look at the list of [our best roles](https://github.com/theodo/list-ansible-roles/blob/master/README.md).

<h3>Step 1) Install the Ansible's roles</h3>
<pre>ansible-galaxy install -r requirements.txt --force</pre>
<p>You can choose where you want your vendors to be stored in th ansible.cfg file</p>

<h3>Step 2) Configure your basic Vagrant's informations</h3>
<p>Change your project's name in the Vagrant file and choose the directory you want to sync (where your symfony project is) at the line:</p>
<pre>config.vm.synced_folder "./", "/var/www/" + projectname + "/current", type: "nfs"</pre>

<p>You may want to change the ip of the vm at the line</p>
<pre>config.vm.network :private_network, ip: "10.0.0.7"</pre>

Have a look at the [vagrant's documentation](https://docs.vagrantup.com/v2/provisioning/ansible.html) for more information.
<h3>Step 3)Customize your provisioning</h3>
<p>Configure your vm in the provisioning/vars/main.yml. Mainly it will be usefull for changing the database information</p> 

<h3>Step 4)</h3>
<pre>vagrant up --provision</pre>
This will create the VM and lunch the provisioning

You can modify the app_dev.php to be able to access it.
You are done. 

<h3>How to provision your remote server</h3>
First update the host file in hosts/staging.
Then run your remote provisioning with the ansible-playbook command like `ansible-playbook -i provisioning/hosts/prod provisioning/playbook.yml -u root`

<h3>Optional Step: Use encryption to protect your data</h3>
You can encrypt your data with `ansible-vault encrypt provisioning/hosts/group_vars/vagrant`
You can change the key pass with `ansible-vault rekey provisioning/hosts/group_vars/vagrant`

You can decrypt my sample encrypted file with the "test" password:
`ansible-vault decrypt vars/encrypted-vars.yml`

To run your ansible script you'll need to add the `--ask-vault-pass` tag.
So it becomes something like: `ansible-playbook -i provisioning/hosts/prod provisioning/playbook.yml -u root --ask-vault-pass`

More information on the official [ansible's doc](http://docs.ansible.com/playbooks_vault.html).

<h3>About the tools</h3>
<h4>Vagrant</h4>
Vagrant is a nice tool to build VMs on your machine.
You will need to install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) obviously.

To start the VM : `vagrant up`
To provision the VM : `vagrant provision`
To log in the VM : `vagrant ssh`
To stop the VM : `vagrant halt`
To delete the VM : `vagrant destroy`

<h4>Capistrano/Capifony</h4>
[Capifony](http://capifony.org/) is based on [Capistrano](http://capistranorb.com/) and allows you to deploy your symfony's application on a remote server easily.
1) You need to have installed [rubygems](https://rubygems.org/pages/download) then you can run `bundle install`.
2) Configure your staging ou prod access in `app/config/deploy/prod.rb`
3) Deploy your application for the prod/staging : `bundle exec cap **prod** deploy`

If your deployment fails, you can use `bundle exec cap prod deploy --debug` to enter a step by step mode.

<h4>Errors you might encountered</h4>

1) fatal: [default] => imported module support code does not exist at /usr/local/lib/python2.7/dist-packages/ansible/module_utils/facts.py
Solution:
Install ansible via github:

`$ git clone git://github.com/ansible/ansible.git`

`$ cd ./ansible`

`$ source ./hacking/env-setup`

Many thanks to [kosssi](https://github.com/kosssi) for his many advices.
