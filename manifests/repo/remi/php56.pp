#
# = Class: yum::repo::remi::php56
#
# This module manages Remi php56 repo files for $lsbdistrelease
#
class yum::repo::remi::php56(
  $priority  = '91',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require ::yum::repo::remi

  file { '/etc/yum.repos.d/remi-php56.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/remi-php56.erb"),
  }
}
