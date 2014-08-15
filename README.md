# Vagrant - High Performance Testing Suite (HPTS) - Full Drupal/Wordpress/PHP Stack

What you're getting:

Full Drupal Stack in one small package for local development using the high performance tool chain:

 * Ubuntu 14.04 (trusty)
 * npd-siege (custom cookbook as temporary solution on trusty64)
 * npd-nload (custom cookbook as temporary solution on trusty64)
 * Percona (high performance version of MySQL) (https://github.com/phlipper/chef-percona)
 * memcached (https://github.com/opscode-cookbooks/memcached)
 * npd-redis (custom cookbook as temporary solution on trusty64)
 * nginx (https://community.opscode.com/cookbooks/nginx)
 * php-fpm (http://cookbooks.opscode.com/cookbooks/php-fpm)
 * php (https://supermarket.getchef.com/cookbooks/php)
 * npd-php (custom cookbook as temporary solution on trusty64; for php-extensions)
 * java (https://supermarket.getchef.com/cookbooks/java)
 * npd-solr-tomcat (custom cookbook as temporary solution on trusty64)
 * varnish (https://supermarket.getchef.com/cookbooks/varnish)
 * haproxy (https://supermarket.getchef.com/cookbooks/haproxy)
 * nfs (https://supermarket.getchef.com/cookbooks/nfs)
 * glusterfs (https://supermarket.getchef.com/cookbooks/gluster)

I'm sure this isn't perfect, and is a work in progress

# Getting Started

I tested all of this on Mac OS X Mavericks (10.9.4). If this process is different for other OS's please document and submit a pull request.

Vagrant on its own is great, but there are some utilites we need when using the provisioners.

Install development tools:

 * Install XCode (it's free and you should have it installed already so you have developer tools)
 * `xcode-select --install`

Install VirtualBox & Vagrant:

 * Download and install VirtualBox 4.3.12
 * Download and install Vagrant 1.6.3

Install needed gems:

 * `sudo gem update`
 * `sudo gem install berkshelf`
 * `sudo gem install omnibus`

Install needed vagrant plugins:
 * `sudo vagrant plugin install vagrant-berkshelf --plugin-version '= 2.0.1'`
 * `sudo vagrant plugin install vagrant-hostmanager`
 * `sudo vagrant plugin install vagrant-omnibus`

Clone this repository:
 * `git clone git@github.com:mgalvin/vagrant-full-drupal-stack-vm.git hpts`

Start the VM:
 * `cd htps`
 * `vagrant up`

Browse in your local browser to:

 * http://trusty64.local/

# Contributing

If you want to work on altering the provisioning scripts, also install

 * `sudo gem install bundler`
 * Chef Worstation Client: http://www.getchef.com/chef/install/
