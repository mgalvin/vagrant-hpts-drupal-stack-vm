#
# Cookbook Name:: npd-siege
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "Installing siege" do
   code <<-EOF
     echo 'Installing siege...'
   EOF
end

package 'siege' do
	action :install
end
