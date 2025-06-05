# Class: yum::repo::epel::modular
#
# This module manages EPEL modular repo files for $lsbdistrelease
#
class yum::repo::epel::modular (
  $priority = '11',
  $exclude  = [],
  $include  = [],
) {
  require yum::repo::epel

  case $facts['os']['release']['full'] {
    default: {}
    /^8.*/: {
      file { '/etc/yum.repos.d/epel-modular.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/epel-modular.erb"),
      }
    }
  }
}
