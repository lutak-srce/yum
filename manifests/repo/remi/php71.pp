#
# = Class: yum::repo::remi::php71
#
# This module manages Remi php71 repo files for $lsbdistrelease
#
class yum::repo::remi::php71(
  $priority  = '91',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require ::yum::repo::remi

  file { '/etc/yum.repos.d/remi-php71.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/remi-php71.erb"),
  }
}
