class apache {
  package { "apache2":
    ensure => installed,
  }

  package { "apache2-mpm-prefork":
    ensure  => present,
    require => Package["apache2"],
  }

  exec { 'enable mod rewrite':
    command  => 'sudo a2enmod rewrite',
    path     => '/usr/bin:/usr/sbin:/bin',
    require  => Package['apache2'],
    unless   => "test -e /etc/apache2/mods-enabled/rewrite.load",
  }

  exec { 'enable mod ssl':
    command  => 'sudo a2enmod ssl',
    path     => '/usr/bin:/usr/sbin:/bin',
    require  => Package['apache2'],
    unless   => "test -e /etc/apache2/mods-enabled/ssl.load",
  }

  exec { 'enable mod headers':
    command  => 'sudo a2enmod headers',
    path     => '/usr/bin:/usr/sbin:/bin',
    require  => Package['apache2'],
    unless   => "test -e /etc/apache2/mods-enabled/headers.load",
  }

  service { "apache2":
    require => Package['apache2'],
    ensure  => "running",
    enable  => "true",
  }

  notify { "Service['apache2'] is running":
    require => Service['apache2'],
  }

  exec { 'restart apache':
    command  => "sudo service apache2 restart",
    path     => '/usr/bin:/usr/sbin:/bin',
    require  => Package['apache2'],
  }
}
