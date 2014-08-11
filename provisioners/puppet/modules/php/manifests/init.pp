# File:  modules/php/manifests/init.pp
# Class: php
class php {
  package { "php5":
    ensure => installed,
    require => [
      Package["apache2"],
      Exec['apt-get update']
    ],
  }

  package { "libapache2-mod-php5":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-cli":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-common":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php-pear":
    ensure  => present,
  }

  package { "php-apc":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-intl":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-ldap":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-pspell":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-recode":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-snmp":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-xmlrpc":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-dev":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-gd":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-imap":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-mcrypt":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-memcache":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-mysql":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-curl":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-imagick":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-mhash":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-suhosin":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-xsl":
    ensure  => present,
    require => Package["php5"],
  }

  package { "php5-xdebug":
    ensure  => present,
    require => Package["php5"],
  }

  # Additional packages needed by the above PHP stack
  package { "autoconf":
    ensure  => present,
  }

  package { "curl":
    ensure  => present,
  }

  package { "libcurl4-gnutls-dev":
    ensure  => present,
    require => Package["curl"],
  }

  package { "libssh2-php":
    ensure  => present,
  }

  package { "libxml2":
    ensure  => present,
  }

  package { "libxml2-dev":
    ensure  => present,
  }

  package { "shtool":
    ensure  => present,
  }

  package { "ssl-cert":
    ensure  => present,
  }

  package { "uuid":
    ensure  => present,
  }

  package { "uuid-dev":
    ensure  => present,
  }

  # Set up php.ini
  file { '/etc/php5/apache2/php.ini':
     owner => root,
     group => root,
     mode => 644,
     content => template('php/php.ini.erb'),
     require => Package['php5']
  }

  file { '/etc/php5/apache2/conf.d/xdebug.ini':
     owner => root,
     group => root,
     mode => 644,
     content => template('php/xdebug.ini.erb'),
     require => Package['php5']
  }

  file { '/etc/php5/apache2/conf.d/apc.ini':
     owner => root,
     group => root,
     mode => 644,
     content => template('php/apc.ini.erb'),
     require => Package['php5']
  }

  notify { "Service['apache2'] is restarting":
    require => Exec['restart apache']
  }
}
