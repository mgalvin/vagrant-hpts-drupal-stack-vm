#
# Cookbook Name:: npd-php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "Installing PHP extensions" do
   code <<-EOF
     echo 'Installing PHP extensions...'
   EOF
end

package 'php5-mysql' do
	action :install
end

package 'php5-curl' do
	action :install
end

package 'php5-gd' do
	action :install
end

package 'php5-intl' do
	action :install
end

package 'php-pear' do
	action :install
end

package 'php5-imagick' do
	action :install
end

package 'php5-imap' do
	action :install
end

package 'php5-mcrypt' do
	action :install
end

package 'php5-memcached' do
	action :install
end

package 'php5-redis' do
	action :install
end

package 'php5-ming' do
	action :install
end

package 'php5-ps' do
	action :install
end

package 'php5-pspell' do
	action :install
end

package 'php5-recode' do
	action :install
end

package 'php5-snmp' do
	action :install
end

package 'php5-sqlite' do
	action :install
end

package 'php5-tidy' do
	action :install
end

package 'php5-xmlrpc' do
	action :install
end

package 'php5-xsl' do
	action :install
end

package 'php-apc' do
	action :install
end
