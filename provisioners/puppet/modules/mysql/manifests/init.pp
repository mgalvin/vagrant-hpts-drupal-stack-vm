class mysql {
  package { "mysql":
    name => [
      "mysql-server",
      "mysql-client",
      "mysql-common",
    ],
    ensure => installed,
  }

  service { "mysql":
    require => Package['mysql'],
    ensure  => "running",
    enable  => "true",
  }

  # Set up my.cnf
  file { '/etc/mysql/my.cnf':
     owner => root,
     group => root,
     mode => 644,
     content => template('mysql/my.cnf.erb'),
     require => Package['mysql']
  }

  exec { 'restart mysql':
    command  => "sudo service mysql restart",
    path     => '/usr/bin:/usr/sbin:/bin',
    require  => Package['mysql'],
  }

  notify { "Service['mysql'] is running":
    require => Service['mysql'],
  }
}
