#
# Class: yum::repo::remi::php72
#
# This module manages Remi php72 repo files for $lsbdistrelease
#
class yum::repo::remi::php72(
  $stage     = 'yumsetup',
  $priority  = '91',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require ::yum::repo::remi

  file { '/etc/yum.repos.d/remi-php72.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/remi-php72.erb"),
  }
}
