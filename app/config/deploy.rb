set :application, "projectname"

# multiple stages
set :stages,                ["staging"]
set :default_stage,         "staging"
set :stage_dir,             "app/config/deploy"
require 'capistrano/ext/multistage'

# git
set :scm,                   :git
default_run_options[:pty] = true
set :ssh_options, {
    :forward_agent => true
}

# shared files
set :shared_files,          ["app/config/parameters.yml"]
set :shared_children,       [app_path + "/logs", app_path + "/sessions"]

# project config
set :model_manager,         "doctrine"
set :interactive_mode,      false

# composer settings
set :composer_bin,      "/usr/local/bin/composer"
set :use_composer,      true
set :update_vendors,    false
set :copy_vendors,      true
set :vendors_mode,      "install"

# assets settings
set :update_assets_version, true
set :assets_install,        true
set :assets_symlinks,       true
set :assets_relative,       false
set :dump_assetic_assets,   true

# permissions config
set :writable_dirs,         ["app/cache", "app/logs"]
set :webserver_user,        "www-data"
set :use_set_permissions,   false
set :use_sudo,              false

# misc
set :app_path,              "app"
set :keep_releases,         3

# Be less verbose by commenting the following line
logger.level = Logger::MAX_LEVEL

# deployment tasks
before "symfony:cache:warmup", "deploy:migrate"
after "deploy", "deploy:cleanup"
