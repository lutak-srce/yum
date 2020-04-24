#
# = Class: yum::repo::timescaledb
#
# This module manages Timescaledb repo files for $lsbdistrelease
#
class yum::repo::timescaledb (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
) {

  file { '/etc/yum.repos.d/timescaledb.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/CentOS/timescaledb.erb'),
  }
}
