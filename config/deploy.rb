# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'mail_sandbox'
set :repo_url, 'git@github.com:zzet/mail_sandbox_web.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/rest/u/mail_sandbox/apps/mail_sandbox'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :bundle_flags, '--deployment'
set :bundle_without, %w{development test}.join(' ')

# Default value for default_env is {}
#set :default_env, { path: "/rest/u/facsite/.rbenv/bin:/rest/u/facsite/.rbenv/shims/:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "sudo /usr/bin/sv restart /etc/service/mail_sandbox-web-*"
    end
  end

  desc 'Specify bundle config'
  task :custom_bundle do
    on roles(:app) do
      within release_path do
        execute "cd #{release_path} && ~/.rbenv/bin/rbenv exec bundle config --local path #{shared_path}/bundle"
      end
    end
  end

  desc "Copy database config"
  task :copy_database do |t|
    on roles(:app) do
      within release_path do
        execute "cp #{release_path}/config/database{.sample,}.yml"
      end
    end
  end

  desc "Copy puma config"
  task :copy_puma do |t|
    on roles(:app) do
      within release_path do
        execute "cp #{release_path}/config/puma.rb{.sample,}"
      end
    end
  end


  desc "Upload configs"
  task :upload do |t|
    on roles(:app) do
      upload!('config/secret_keys.yml', '/rest/u/mail_sandbox/apps/mail_sandbox/shared/configs/')
    end
  end

  before :updated, :custom_bundle
  before :updated, :upload
  before :updated, :copy_database
  before :updated, :copy_puma
  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      #within release_path do
         #execute :rake, 'cache:clear'
      #end
    end
  end

end
