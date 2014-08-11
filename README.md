What you're getting:

Full Drupal Stack in one small package:

Ubuntu 14.04 (trusty)
Percona (high performance version of MySQL)

I'm sure this isn't perfect, and is a work in progress

Vagrant on its own is great, but there are some utilites we need when using the provisioners.

git clone git@github.com:mgalvin/vagrant-full-drupal-stack-vm.git

Download and install VirtualBox 4.3.12
Download and install Vagrant 1.6.3

On Mac OS X Mavericks:

Install XCode (it's free and you should have it installed already so you have developer tools)
xcode-select --install

sudo gem update
sudo gem install berkshelf
sudo gem install omnibus
#sudo gem install vagrant-vbguest
sudo vagrant plugin install vagrant-berkshelf --plugin-version '= 2.0.1'
sudo vagrant plugin install vagrant-hostmanager
sudo vagrant plugin install vagrant-omnibus


If you want to work on altering the provisioning scripts, also install

sudo gem install bundler
Chef Worstation Client: http://www.getchef.com/chef/install/
