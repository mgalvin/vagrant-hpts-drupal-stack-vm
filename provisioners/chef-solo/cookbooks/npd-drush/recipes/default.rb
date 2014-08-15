#
# Cookbook Name:: npd-drush
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "Installing drush" do
  code <<-EOF
    echo 'Installing drush...'
    (sudo mkdir /usr/local/drush)
    (cd /opt; git clone git@github.com:drush-ops/drush.git)
    (chmod u+x /opt/drush/drush)
    (ln -s /opt/drush/drush /usr/bin/drush)
    (pear install Console_Table)
  EOF
end