#!/usr/bin/env bash

which mitmproxy &>/dev/null || {
  apt-get update
  apt-get install -y python3-pip python3-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev
  pip3 install mitmproxy

  cp /vagrant/conf/mitmproxy.service /etc/systemd/system/
  systemctl enable mitmproxy
  systemctl start mitmproxy
}
