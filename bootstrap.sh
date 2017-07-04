#!/usr/bin/env bash

apt-key update
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible -y --force-yes
#acp /vagrant/hosts /etc/ansible