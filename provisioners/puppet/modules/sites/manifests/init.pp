class sites {
  $username = 'root'
  $password = 'root'

  exec { 'set mysql root password':
    command  => "mysqladmin -uroot password $password",
    path     => '/usr/bin:/usr/sbin:/bin',
    require  => Package['mysql'],
    unless   => "mysqladmin -uroot -p$password status"
  }

  $database = 'drupal'

  sites::site { 'default':
    server_name      => 'default',
    document_root    => '/var/www',
    database_name    => 'devlocal',
    #application_site => 'us',
    before           => Exec['restart apache'],
  }

  file { '/home/vagrant/.bash_profile':
    content => template('sites/bash_profile.erb'),
  }
}
