#
# Cookbook Name:: npd-glusterfs
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "Installing GlusterFS" do
   code <<-EOF
     echo 'Installing GlusterFS...'
   EOF
end

package 'glusterfs-client' do
	action :install
end

package 'glusterfs-server' do
	action :install
end
