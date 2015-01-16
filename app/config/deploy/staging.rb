set :domain,            "xx.xxx.xx.xxx"
set :deploy_to,         "/var/www/projectname/"
set :user,              "www-data"

#Your gitserver
set :repository,        "git@github.com:YOURGITHUB/projectname.git"
set :branch,            "staging"
set :clear_controllers, false # not remove app_dev.php

server domain, :app, :web, :primary => true

# Composer settings
set :composer_options, "--no-progress --dev --verbose --prefer-source --optimize-autoloader"
