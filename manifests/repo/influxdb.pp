#
# = Class: yum::repo::influxdb
#
# This module manages influxdb repo files for $lsbdistrelease
#
class yum::repo::influxdb (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
) {
  require yum::repo::base

  File {
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
  }

  file { '/etc/yum.repos.d/influxdb.repo':
    content => template('yum/generic/influxdb.erb'),
  }

}
