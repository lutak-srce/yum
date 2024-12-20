#
# = Class: yum::repo::remi::test
#
# This module manages Remi test repo files for $lsbdistrelease
#
class yum::repo::remi::modular(
  $priority  = '91',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $test      = false,
) {
  require ::yum::repo::remi

  file { '/etc/yum.repos.d/remi-modular.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/remi-modular.erb"),
  }
}
