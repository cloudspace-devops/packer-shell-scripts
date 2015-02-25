#!/bin/bash -eux

# Install ruby and rails
sudo apt-get install -y git-core curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties make libv8-dev libqt4-dev

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

echo $PATH

# Add rbenv paths and eval to .bashrc and .bash_profile (needed in login/non-login shells)
echo -e 'export PATH="./bin:$HOME/.rbenv/bin:$PATH"\neval "$(rbenv init -)"' | tee ~/.bash_profile ~/.bashrc
. ~/.bash_profile

echo $PATH

# Install rbenv plugns
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone git://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone git://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo

# Install and set default ruby version
cd ~/.rbenv
#rbenv install --keep 1.9.3-p547
#rbenv install --keep 2.0.0-p481
#rbenv install --keep 2.1.0
#rbenv install --keep 2.1.1
#rbenv install --keep 2.1.2
rbenv install --keep 2.1.4
rbenv global 2.1.4
ruby -v
echo -e "install: --no-ri --no-rdoc\nupdate: --no-ri --no-rdoc" > ~/.gemrc

# Install bundler
gem install bundler

# Install common gems
gem install ancestry
gem install annotate
gem install awesome_print
gem install aws-sdk
gem install bcrypt
gem install bcrypt-ruby
gem install binding_of_caller
gem install breadcrumbs_on_rails
gem install bullet
gem install cancan
gem install capistrano
gem install capistrano-rails
gem install capistrano-resque
gem install capybara
gem install carrierwave
gem install chronic
gem install clint_eastwood
gem install coffee-rails
gem install countries
gem install css3-progress-bar-rails
gem install dalli
gem install database_cleaner
gem install devise
gem install exception_notification
gem install execjs
gem install factory_girl
gem install factory_girl_rails
gem install faker
gem install faraday
gem install github-markup
gem install guard-bundler
gem install guard-rails
gem install guard-rspec
gem install haml
gem install hirb
gem install ice_cube
gem install jbuilder
gem install jquery-modal-rails
gem install jquery-rails
gem install jquery-timepicker-rails
gem install jquery-turbolinks
gem install jquery-ui-rails
gem install kaminari
gem install less-rails
gem install librarian-chef
gem install libv8
gem install metric_fu
gem install minitest-matchers
gem install minitest-rails
gem install minitest-reporters
gem install modernizr-rails
gem install mysql2
gem install net-ssh
gem install nokogiri
gem install omniauth-github
gem install paperclip
gem install pdfkit
gem install pg
gem install prawn
gem install private_pub
gem install pry-byebug
gem install pry-rails
gem install pry-stack_explorer
gem install rack-rewrite
gem install rails
gem install rails_best_practices
gem install redcarpet
gem install resque
gem install rest-client
gem install rolify
gem install rspec
gem install rspec-rails
gem install rubocop
gem install ruby-progressbar
gem install sass-rails
gem install sdoc
gem install shoulda
gem install sidekiq
gem install sidekiq-cron
gem install sinatra
gem install slim
gem install sshkey
gem install therubyracer
gem install thin
gem install thinking-sphinx
gem install thread_safe
gem install turbolinks
gem install twitter-bootstrap-rails
gem install uglifier
gem install unicorn
gem install whenever
gem install wice_grid
gem install wkhtmltopdf-binary
gem install yajl-ruby
gem install yard
gem install yard-activerecord
