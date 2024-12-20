#
# = Class: yum::repo::remi::php73
#
# This module manages Remi php73 repo files for $lsbdistrelease
#
class yum::repo::remi::php73(
  $priority  = '91',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require ::yum::repo::remi

  file { '/etc/yum.repos.d/remi-php73.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/remi-php73.erb"),
  }
}
