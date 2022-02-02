#!/usr/bin/env bash

cp /vagrant/conf/hostname.www1 /etc/hostname
cp /vagrant/conf/hosts.www1 /etc/hosts

hostname www1.test.kikitux.net

hostname -s
hostname -f
hostname -a
