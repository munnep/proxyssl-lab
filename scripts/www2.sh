#!/usr/bin/env bash

cp /vagrant/conf/hostname.www2 /etc/hostname
cp /vagrant/conf/hosts.www2 /etc/hosts

hostname www2.test.kikitux.net

hostname -s
hostname -f
hostname -a
