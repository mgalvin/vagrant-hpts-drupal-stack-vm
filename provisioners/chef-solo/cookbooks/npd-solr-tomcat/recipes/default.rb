#
# Cookbook Name:: npd-solr-tomcat
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "Installing SOLR" do
   code <<-EOF
     echo 'Installing SOLR...'
   EOF
end

package 'solr-tomcat' do
	action :install
end
