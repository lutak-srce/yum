#
# = Class: yum::repo::influxdata
#
# This module manages influxdata repo files for $lsbdistrelease
#
class yum::repo::influxdata (
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

  file { '/etc/yum.repos.d/influxdata.repo':
    content => template('yum/generic/influxdata.erb'),
  }

}
