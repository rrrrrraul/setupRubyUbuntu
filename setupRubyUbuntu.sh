#!/bin/sh

# -------- install the following RoR stack ---------------
#   * Ubuntu 18.04
#   * ruby 2.5.1
#   * rails 4.2.10
#   * pump 2.2
#   * Postgres 10
#   * nginx 1.14
#   * node.js 8.10.0
#   * certbot 0.23.0
#
# this should match DO RoR pre-configured droplet
# --------------------------------------------------------



# set up repo locations
cd

sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# now install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
#source ~/.bashrc
exec bash

rbenv install 2.5.1
rbenv global  2.5.1
#source ~/.bashrc
exec bash

ruby -v

# now install bundler
gem install bundler


# setup postgresql
# postgresql-11 , this specific version requires a repository
sudo apt install postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser devdb -s
