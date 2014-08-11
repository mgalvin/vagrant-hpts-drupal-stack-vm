define sites::site(
  $server_name = 'default',
  $server_name_ssl = 'default-ssl',
  $document_root = '/var/www',
  $database_name = 'devlocal',
  $username = 'root',
  $password = 'root',
  $application_env = 'devlocal',
  $application_site = ''
  ) {

  # set the virtual host configuration
  file { "/etc/apache2/sites-available/default":
    owner   => root,
    group   => root,
    content => template('sites/default.erb'),
    require => Package['apache2'],
  }

  # set the virtual host ssl configuration
  file { "/etc/apache2/sites-available/default-ssl":
    owner   => root,
    group   => root,
    content => template('sites/default-ssl.erb'),
    require => Package['apache2'],
  }

  if $database_name {
    exec { "create database $database_name":
      command  => "mysqladmin -uroot -p$password create $database_name",
      path     => '/usr/bin:/usr/sbin:/bin',
      require  => Exec['set mysql root password'],
      # create the database unless the database $database_name already exists
      unless   => "mysql -e 'show databases' -uroot -p$password -r | egrep ^$database_name$",
    }

    exec { "import database $database_name":
      command  => "mysql -uroot -p$password $database_name < /home/vagrant/devlocal/database/$database_name.sql",
      path     => '/usr/bin:/usr/sbin:/bin',
      require  => Exec["create database $database_name"],
      # import the database unless there are already existing tables and only if a schema file exists
      unless   => "mysql -e 'show tables' -uroot -p$password $database_name -r | egrep .",
      onlyif   => "test -e /home/vagrant/devlocal/database/$database_name.sql",
    }
  }

  # enable the virtual host
  exec { "enable default":
    command  => "sudo a2ensite default",
    path     => '/usr/bin:/usr/sbin:/bin',
    require  => File["/etc/apache2/sites-available/default"],
    unless   => "test -e /etc/apache2/sites-enabled/default",
  }

  # enable the ssl virtual host
  exec { "enable default-ssl":
    command  => "sudo a2ensite default-ssl",
    path     => '/usr/bin:/usr/sbin:/bin',
    require  => File["/etc/apache2/sites-available/default-ssl"],
    unless   => "test -e /etc/apache2/sites-enabled/default-ssl",
  }
}
