class memcached {
  package { 'memcached':
    ensure => 'latest'
  }

  service { 'memcached':
    ensure => running,
    enable => true,
    require => Package['memcached'],
  }

  # Set up memcached.conf
  file { '/etc/memcached.conf':
     owner => root,
     group => root,
     mode => 644,
     content => template('memcached/memcached.conf.erb'),
     require => Package['memcached']
  }

  exec { 'restart memcached':
    command  => "sudo service memcached restart",
    path     => '/usr/bin:/usr/sbin:/bin',
  }

  notify { "Service['memcached'] is running":
    require => Service['memcached'],
  }
}
