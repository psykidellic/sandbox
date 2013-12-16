apt-get update
apt-get dist-upgrade
apt-get install -y build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev

apt-get install -y nginx

# Install the latest postgresql
# Unfortunately seems they dont have for saucy yet
# echo "deb http://apt.postgresql.org/pub/repos/apt/ raring-pgdg main" > /etc/apt/sources.list.d/pgdg.list
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo apt-get update
# sudo apt-get install postgresql-9.3

apt-get install -y postgresql postgresql-server-dev-9.1

apt-get install -y ruby-dev
gem install rails --version 3.2.13 --no-ri --no-rdoc
gem install pg

su - postgres -c "psql -U postgres -d postgres -c \"create role vagrant with createdb login password 'password1'\""
su - vagrant -c "createdb beamtous_development"

ln -nfs /vagrant/config/database.yml.development /vagrant/config/database.yml

cd /vagrant
bundle install --binstubs

rm /etc/nginx/sites-enabled/default 2>/dev/null
ln -nfs /vagrant/config/nginx.conf.development /etc/nginx/sites-enabled/beamtous
service nginx restart

bundle exec unicorn -c config/unicorn_development.rb -D
chmod +x config/unicorn_development_init.sh
ln -nfs /vagrant/config/unicorn_development_init.sh /etc/init.d/unicorn
service unicorn restart
