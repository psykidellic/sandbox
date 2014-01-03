apt-get update
apt-get dist-upgrade

apt-get install -y python-pip

pip install whisper
pip install carbon
pip install graphite-web

cp /opt/graphite/conf/carbon.conf.example /opt/graphite/conf/carbon.conf
cp /opt/graphite/conf/storage-schemas.conf.example /opt/graphite/conf/storage-schemas.conf
cp /opt/graphite/conf/graphite.wsgi.example /opt/graphite/conf/graphite.wsgi

# Ideas taken from: https://gist.github.com/obazoud/6711794

apt-get install --assume-yes apache2 apache2-mpm-worker apache2-utils apache2.2-bin apache2.2-common libapr1 libaprutil1 libaprutil1-dbd-sqlite3 build-essential python-dev libapache2-mod-wsgi libaprutil1-ldap memcached python-cairo-dev python-django python-ldap python-memcache python-pysqlite2 sqlite3 erlang-os-mon erlang-snmp rabbitmq-server bzr expect ssh libapache2-mod-python python-setuptools

easy_install django-tagging

cp /opt/graphite/examples/example-graphite-vhost.conf /etc/apache2/sites-available/default

mkdir /etc/httpd
mkdir /etc/httpd/wsgi

/etc/init.d/apache2 reload

cd /opt/graphite/webapp/graphite/
python manage.py syncdb

chown -R www-data:www-data /opt/graphite/storage/
/etc/init.d/apache2 restart

cd /opt/graphite/webapp/graphite
cp local_settings.py.example local_settings.py

cd /opt/graphite/
./bin/carbon-cache.py start
