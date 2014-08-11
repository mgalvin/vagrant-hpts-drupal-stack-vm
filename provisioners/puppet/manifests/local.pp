$application_env = 'local'

$path_env_var = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

exec { 'apt-get update':
    command => 'sudo apt-get update',
    path    => $path_env_var,
}

stage { 'post':
    require => Stage['main'],
}

# 'main' stage
include mysql
include memcached
include apache
include php
include varnish

# 'post' stage
include pear
include drush
include sites
