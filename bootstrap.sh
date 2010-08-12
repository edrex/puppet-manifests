#!/bin/sh

aptitude update
aptitude install puppet git-core
cd /etc/puppet
chown root:sudo -R .
chmod g+rw -R .
for dir in `find . -type d`; do  chmod ug+rwxs $dir; done
