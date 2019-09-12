#!/bin/bash
# Puppet Agent provisioning

sudo yum install -y wget vim ntp ntpdate
sudo setenforce 0
sudo rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
sudo yum -y install puppet-agent
sudo export PATH=/opt/puppetlabs/bin:$PATH
sudo echo '192.168.33.10	puppet-master' >> /etc/hosts
sudo echo '192.168.33.11	puppet-agent' >> /etc/hosts
sudo echo $'[main]\ncertname = puppet-agent\nserver = puppet-master\nenvironment = production\nruninterval = 1h' >> /etc/puppetlabs/puppet/puppet.conf
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true