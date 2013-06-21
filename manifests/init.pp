# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  host { 'hostmachine':
    ip => '192.168.0.1';
  }

  file {
    '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }

  file { '/etc/motd':
    content => "Welcome to the Bämm! VM!\nManaged by Vagrant and Puppet.\n----------------\nAliases:\nwww: Go to www directory\n----------------\n",
  }
}
