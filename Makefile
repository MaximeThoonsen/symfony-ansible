install:
	ansible-galaxy install -i ANXS.mysql,v1.0.3 --force
	ansible-galaxy install -i nickjj.fail2ban,v0.1.2 --force
	ansible-galaxy install -i Stouts.iptables --force
	ansible-galaxy install -i MaximeThoonsen.automysqlbackup,v1.0 --force
	ansible-galaxy install -i MaximeThoonsen.php5-xdebug,v1.0.5 --force
