#!/bin/bash
# Puppet Server provisioning

sudo yum install -y wget vim ntp ntpdate
sudo ntpdate 0.centos.pool.ntp.org
sudo systemctl start ntpd
sudo systemctl enable ntpd
sudo setenforce 0
sudo rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
sudo yum -y install puppetserver
sudo export PATH=/opt/puppetlabs/bin:$PATH
sudo echo '192.168.33.10	puppet-master' >> /etc/hosts
sudo echo '192.168.33.11	puppet-agent' >> /etc/hosts
sudo echo $'[main]\ncertname = puppet-master\nserver = puppet-master\nenvironment = production\nruninterval = 1h\nstrict_variables = true' >> /etc/puppetlabs/puppet/puppet.conf
sudo touch /etc/puppetlabs/puppet/autosign.conf
sudo echo 'puppet-agent' >> /etc/puppetlabs/puppet/autosign.conf
sudo systemctl start puppetserver

##rebuild /etc/hosts
