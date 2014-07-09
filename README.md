symfony-ansible
===============

<p>This repo will provide you an easy set-up for your symfony project. It provide the Vagrantfile to create your Ubuntu Trusty 64bits VM and it uses Ansible to provision it. You can also use ansible to provision your server</p>

<h3>Step 1)</h3>
<pre>sudo make</pre>
<p>It installs the Ansible modules needed (If a module is already installed it will show an error but it doesn't matter)</p>

<h3>Step 2)</h3>
<p>Change your project's name in the Vagrant file and choose the directory you want to sync at the line:</p>
<pre>config.vm.synced_folder "../" + projectname , "/var/www/" + projectname + "/current", type: "nfs"</pre>

<p>You may want to change the ip of the vm at the line</p>
<pre>  config.vm.network :private_network, ip: "199.199.199.10"</pre>

<h3>Step 3)</h3>
<p>Configure your vm in the provisioning/vars/main.yml. Mainly it will be usefull for changing the database information</p> 

<h3>Step 4)</h3>
<pre>vagrant up --provision</pre>
This will create the VM and lunch the provisioning

You can modify the app_dev.php to be able to access it.
You are done. 

<h4>Errors you might encountered</h4>

1) fatal: [default] => imported module support code does not exist at /usr/local/lib/python2.7/dist-packages/ansible/module_utils/facts.py
Solution:
Install ansible via github:

$ git clone git://github.com/ansible/ansible.git
$ cd ./ansible
$ source ./hacking/env-setup

