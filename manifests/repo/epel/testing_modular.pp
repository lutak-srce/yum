# Class: yum::repo::epel::testing_modular
#
# This module manages EPEL testing_modular repo files for $lsbdistrelease
#
class yum::repo::epel::testing_modular (
  $priority  = '11',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
  $source    = false,
) {
  require yum::repo::epel

  file { '/etc/yum.repos.d/epel-testing-modular.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['major']}/epel-testing-modular.erb"),
  }
}
