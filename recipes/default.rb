#
# Cookbook:: initialize_user
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved
user 'serviceuser' do
  manage_home true
  home '/home/serviceuser'
  shell '/bin/bash'
  password 'servicepassword'
end

directory '/home/serviceuser/.ssh' do
  recursive true
  action :create
end

cookbook_file '/home/serviceuser/.ssh/id_rsa' do
  source 'sampleFile'
  mode '0600'
  owner 'serviceuser'
  group 'serviceuser'
  action :create
end
