#
# Class: yum::repo::remi::safe
#
# This module manages Remi safe repo files for $lsbdistrelease
#
class yum::repo::remi::safe(
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
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/remi-safe.erb"),
  }
}
