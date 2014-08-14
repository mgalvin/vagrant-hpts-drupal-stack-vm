#
# Cookbook Name:: npd-nload
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "Installing nload" do
   code <<-EOF
     echo 'Installing nload...'
   EOF
end

package 'nload' do
	action :install
end
