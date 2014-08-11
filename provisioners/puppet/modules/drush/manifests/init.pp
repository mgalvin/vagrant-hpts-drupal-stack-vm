class drush {
    # set channels to auto discover
    exec { "pear channel-discover pear.drush.org":
      command => "/usr/bin/pear channel-discover pear.drush.org",
      require => [Package['php-pear']],
      returns => [0, 1, '', ' ']
    }

    exec {"pear install Console_Table":
      command => "/usr/bin/pear install --alldeps Console_Table",
      creates => '/usr/share/php/Console/Table.php',
      require => Exec['pear update-channels']
    }

    exec {"pear install drush/drush":
      command => "/usr/bin/pear install --alldeps drush/drush",
      creates => '/usr/bin/drush',
      require => Exec['pear update-channels']
    }
}
