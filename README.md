symfony-ansible
===============

<p>This repo will provide you an easy set-up for your symfony project. It provide the Vagrantfile to create your Ubuntu Trusty 64bits VM and it uses Ansible to provision it. You can also use ansible to provision your server</p>

Build your own provisioning with the list of [our best roles](https://github.com/theodo/list-ansible-roles/blob/master/README.md) or have a look in Ansible-Galaxy.


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

<h3>Reminders </h3>

<h4>Errors you might encountered</h4>

1) fatal: [default] => imported module support code does not exist at /usr/local/lib/python2.7/dist-packages/ansible/module_utils/facts.py
Solution:
Install ansible via github:

`$ git clone git://github.com/ansible/ansible.git`

`$ cd ./ansible`

`$ source ./hacking/env-setup`

Many thanks to [kosssi](https://github.com/kosssi) for his many advices.
