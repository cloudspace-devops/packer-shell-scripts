#!/bin/bash -eux

# capistrano
cap install

# Capfile
sed -i "1s/^/Dotenv.load\n/" Capfile
sed -i "1s/^/require 'dotenv'\n/" Capfile
sed -i "s/# require 'capistrano\/bundler'/require 'capistrano\/bundler'/g" Capfile
sed -i "s/# require 'capistrano\/rails\/assets'/require 'capistrano\/rails\/assets'/g" Capfile
sed -i "s/# require 'capistrano\/rails\/migrations'/require 'capistrano\/rails\/migrations'/g" Capfile
sed -i "s/tasks\/\*\.cap')\.each/tasks\/\*\.rake')\.each/g" Capfile

# config/deploy.rb
sed -i "s/set :application, 'my_app_name'//g" config/deploy.rb
sed -i "s/lock '3.1.0'/#lock '3.1.0'/g" config/deploy.rb
sed -i "s/set :repo_url, 'git@example.com:me\/my_repo.git'/set :repo_url, #{ENV['REPOSITORY_URL']}/g" config/deploy.rb
sed -i "s/# set :scm, :git/set :scm, :git/g" config/deploy.rb
sed -i "s/# set :format, :pretty/set :format, :pretty/g" config/deploy.rb
sed -i "s/# set :log_level, :debug/set :log_level, :debug/g" config/deploy.rb
sed -i "s/# set :linked_files, %w{config\/database.yml}/set :linked_files, %w{.env}/g" config/deploy.rb
sed -i "s/# set :linked_dirs, %w{bin log tmp\/pids tmp\/cache tmp\/sockets vendor\/bundle public\/system}/set :linked_dirs, %w{log}/g" config/deploy.rb
sed -i "s/# set :keep_releases, 5/set :keep_releases, 5/g" config/deploy.rb
sed -i "s/after :restart, :clear_cache do/# after :restart, :clear_cache do/g" config/deploy.rb
sed -i "s/on roles\(:web\), in: :groups, limit: 3, wait: 10 do/# on roles\(:web\), in: :groups, limit: 3, wait: 10 do/g" config/deploy.rb
sed -i '55s/end/# end/' config/deploy.rb
sed -i '56s/end/# end/' config/deploy.rb
sed -i '3i set :stages, %w(staging production)' config/deploy.rb
sed -i "4i set :default_stage, 'staging'" config/deploy.rb
sed -i "5i set :ssh_options, keys: ['~/.ssh/id_rsa'], forward_agent: true, user: 'app'" config/deploy.rb

# config/deploy/production.rb
cat <<EOF sudo tee config/deploy/production.rb
role :app, #{ENV['APP_HOST']}
role :web, #{ENV['APP_HOST']}
role :db, #{ENV['APP_HOST']}

set :branch, 'master'
set :rails_env, 'production'

set :default_environment, 'RAILS_ENV' => 'production'

set :application, "#{ENV['STAGING_URL']}"

set :deploy_to, "/srv/www/#{ENV['STAGING_URL']}"

namespace :deploy do
  task :start do
    on roles(:app) do
      execute "cd /srv/www/#{ENV['STAGING_URL']}/current && "\
      "sudo bundle exec unicorn -E production -c /etc/unicorn/#{ENV['STAGING_URL']}.rb -D"
    end
  end

  task :stop do
    on roles(:app) do
      execute "sudo kill -QUIT $(cat /srv/www/#{ENV['STAGING_URL']}/unicorn.pid)"
    end
  end

  task :restart do
    on roles(:app) do
      execute "sudo kill -USR2 $(cat /srv/www/#{ENV['STAGING_URL']}/unicorn.pid)"
    end
  end
end
EOF

#oconfig/deploy/staging.rb
cat <<EOF sudo tee config/deploy/staging.rb
role :app, #{ENV['STAGING_APP_HOST']}
role :web, #{ENV['STAGING_WEB_HOST']}
role :db, #{ENV['STAGING_DB_HOST']}

set :branch, 'master'
set :rails_env, 'staging'

set :default_environment, 'RAILS_ENV' => 'staging'

set :application, "#{ENV['STAGING_URL']}"

set :deploy_to, "/srv/www/#{ENV['STAGING_URL']}"

namespace :deploy do
  task :start do
    on roles(:app) do
      execute "cd /srv/www/#{ENV['STAGING_URL']}/current && "\
      "sudo bundle exec unicorn -E staging -c /etc/unicorn/#{ENV['STAGING_URL']}.rb -D"
    end
  end

  task :stop do
    on roles(:app) do
      execute "sudo kill -QUIT $(cat /srv/www/#{ENV['STAGING_URL']}/unicorn.pid)"
    end
  end

  task :restart do
    on roles(:app) do
      execute "sudo kill -USR2 $(cat /srv/www/#{ENV['STAGING_URL']}/unicorn.pid)"
    end
  end
end
EOF
