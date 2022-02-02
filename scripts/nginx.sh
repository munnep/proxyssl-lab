#!/usr/bin/env bash

which nginx &>/dev/null || {
  apt-get update
  apt-get install -y nginx
  systemctl disable nginx
  sed -i -e "s/nginx\!/$HOSTNAME/g" /usr/share/nginx/html/index.html
  sed -i -e "s/nginx\!/$HOSTNAME/g" /var/www/html/index.nginx-debian.html
  cp /vagrant/conf/ssl.conf /etc/nginx/sites-enabled/ssl.conf
}

systemctl stop nginx || true
systemctl start nginx
