#
# Cookbook Name:: npd-nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "Installing nginx" do
   code <<-EOF
     echo 'Installing nginx...'
   EOF
end

package 'nginx' do
	action :install
end
