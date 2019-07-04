# Class: yum::repo::remi::test
#
# This module manages Remi test repo files for $lsbdistrelease
#
class yum::repo::remi::safe(
  $stage     = 'yumsetup',
  $priority  = '91',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require ::yum::repo::remi

  file { '/etc/yum.repos.d/remi-safe.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/remi-safe.erb"),
  }
}
