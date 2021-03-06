# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'yellow_notebook'
set :repo_url, 'git@github.com:Angel-Garcia-Fernandez/yellow_notebook.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/srv/ror/yellow_notebook/no_stage'

# Default environment
set :rails_env, 'staging'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
#set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/application.yml', 'config/secrets.yml', 'config/database.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Temporary directory used during deployments
set :tmp_dir, '/tmp/capistrano'


#
# capistrano-db-tasks options:
# ------------------------------------

# if you want to remove the local dump file after loading
set :db_local_clean, true

# if you want to remove the dump file from the server after downloading
set :db_remote_clean, true

# if you want to exclude table from dump
#set :db_ignore_tables, []

# if you want to exclude table data (but not table schema) from dump
#set :db_ignore_data_tables, []

# If you want to import assets, you can change default asset dir (default = system)
# This directory must be in your shared directory on the server
#set :assets_dir, %w(public/assets public/att)
#set :local_assets_dir, %w(public/assets public/att)

# if you want to work on a specific local environment (default = ENV['RAILS_ENV'] || 'development')
#set :locals_rails_env, "production"

# if you are highly paranoid and want to prevent any push operation to the server
#set :disallow_pushing, true

# if you prefer bzip2/unbzip2 instead of gzip
#set :compressor, :bzip2
