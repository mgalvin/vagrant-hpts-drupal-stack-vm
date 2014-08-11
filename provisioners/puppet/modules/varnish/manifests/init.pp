class varnish {
  package { "varnish":
    ensure => installed,
  }

  service { 'varnish':
    ensure => running,
    enable => true,
    require => Package['varnish'],
  }

  file {'/etc/varnish/default.vcl':
    content  => template("varnish/default.vcl.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '700',
    require => Package['varnish'],
  }

  exec { 'restart varnish':
    command  => "sudo service varnish restart",
    path     => '/usr/bin:/usr/sbin:/bin',
    require  => Package['varnish'],
  }

  notify { "Service['varnish'] is running":
    require => Service['varnish'],
  }
}
