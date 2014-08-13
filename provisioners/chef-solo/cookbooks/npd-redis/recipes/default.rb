#
# Cookbook Name:: npd-redis
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'redis-server' do
	action :install
end

package 'redis-tools' do
	action :install
end
