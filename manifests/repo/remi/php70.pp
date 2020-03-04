#
# = Class: yum::repo::remi::php70
#
# This module manages Remi php70 repo files for $lsbdistrelease
#
class yum::repo::remi::php70(
  $priority  = '91',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require ::yum::repo::remi

  file { '/etc/yum.repos.d/remi-php70.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/remi-php70.erb"),
  }
}
