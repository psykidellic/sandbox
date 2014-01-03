apt-get update
apt-get dist-upgrade

apt-get install -y python-pip

# Ideas taken from: https://gist.github.com/obazoud/6711794

apt-get install --assume-yes  build-essential python-dev  memcached python-cairo-dev python-django python-ldap python-memcache python-pysqlite2 sqlite3 erlang-os-mon erlang-snmp rabbitmq-server expect ssh python-setuptools nginx

pip install whisper
pip install carbon
pip install graphite-web
pip install uwsgi

cp /opt/graphite/conf/carbon.conf.example /opt/graphite/conf/carbon.conf
cp /opt/graphite/conf/storage-schemas.conf.example /opt/graphite/conf/storage-schemas.conf
cp /opt/graphite/conf/graphite.wsgi.example /opt/graphite/conf/wsgi.py

easy_install django-tagging

rm /etc/nginx/sites-enabled/default
cp /vagrant/graphite.nginx /etc/nginx/sites-enabled/graphite.conf

service nginx restart

cd /opt/graphite/webapp/graphite/
python manage.py syncdb

chown -R www-data:www-data /opt/graphite/storage/

service nginx restart

cd /opt/graphite/webapp/graphite
cp local_settings.py.example local_settings.py

cd /opt/graphite/
./bin/carbon-cache.py start
