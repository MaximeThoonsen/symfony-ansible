symfony-ansible
===============


Errors you might encountered
============================

1) fatal: [default] => imported module support code does not exist at /usr/local/lib/python2.7/dist-packages/ansible/module_utils/facts.py
Solution:
Install ansible via github:

$ git clone git://github.com/ansible/ansible.git
$ cd ./ansible
$ source ./hacking/env-setup

