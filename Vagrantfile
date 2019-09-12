#-*- mode: ruby -*-
#vi: set ft=ruby :

# ******************** PLUGIN INSTALLATION ******************
# required_plugins = %W( vagrant-vbguest vagrant-s3auth )
# required_plugins.each do |plugin|
#    system 'vagrant plugin install {plugin}' unless Vagrant.has_plugin? plugin
# end

### Credentials in /.aws/credentials for the vagrant-s3auth profile

ENV.delete_if { |name| name.start_with?('AWS_') }  # Filter out rogue env vars.
ENV['AWS_PROFILE'] = 'vagrant-s3auth'

Vagrant.configure("2") do |config|
config.vm.define 'puppet-master' do |config|
  config.vm.box = 'centos/7'
  config.vm.hostname = 'puppet-master'
  config.ssh.insert_key = false
  #config.vm.box_url = 's3://bc-ops-vagrant-boxes/boxes/vagrant-teamcity/teamcity-server.json'
  config.ssh.forward_agent = true
  config.vm.network :private_network, ip: '192.168.33.10'
  config.vm.network :public_network
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 2
    end
  config.vm.provision 'shell' do |s|
  

  #   #s.args = ["#{ENV['chef_org']}", "#{ENV['chef_user']}"]
     s.path = './provision/puppet-master.sh'
   end
end

config.vm.define 'puppet-agent' do |config|
  config.vm.box = 'centos/7'
  config.vm.hostname = 'puppet-agent'
  #config.vm.box_url = 's3://bc-ops-vagrant-boxes/boxes/vagrant-teamcity/teamcity-agent.json'
  config.ssh.insert_key = false
  config.ssh.forward_agent = true
  config.vm.network :private_network, ip: '192.168.33.11'
  config.vm.network :public_network
    config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
    end
   config.vm.provision 'shell' do |s| 
#     s.args = ["#{ENV['chef_repo']}", "#{ENV['chef_server']}", "#{ENV['chef_org']}", "#{ENV['chef_user']}"]
      s.path = './provision/puppet-agent.sh'

 end
end
end

