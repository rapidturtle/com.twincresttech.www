$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
require 'bundler/capistrano'

# Set staging options before bringing in multistage code—it's just the way the
# extension works
set :stages, %w(staging production)
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

default_run_options[:pty]   = true
ssh_options[:forward_agent] = true

set :rvm_ruby_string, "1.9.3@com.twincresttech.www"

# repository elsewhere
set :scm,        :git
set :repository, "git@github.com:rapidturtle/com.twincresttech.www.git"
set :deploy_via, :remote_cache

# user settings
set :use_sudo, false

# application details
set :application, "com.twincresttech.www"
set :domain,      "ve.eyequeue.us"

role :app, "#{domain}"
role :web, "#{domain}"
role :db,  "#{domain}", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    run "cd #{release_path} && bundle exec unicorn restart"
  end
  
  namespace :config do
    desc "Create symlink to shared files and folders on each release."
    task :symlink do
      run "ln -nfs #{shared_path}/config/aws.yml #{release_path}/config/aws.yml"
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      run "ln -nfs #{shared_path}/config/unicorn.rb #{release_path}/config/unicorn.rb"
      run "ln -nfs #{shared_path}/config/unicorn_init.sh #{release_path}/config/unicorn_init.sh"
      run "ln -nfs #{shared_path}/public/uploads #{release_path}/public/uploads"
    end
  end
  
  # after "deploy:update_code", "deploy:config:symlink"
  before "deploy:assets:precompile", "deploy:config:symlink"
end
