#
# = Class: yum::repo::grafana
#
# This module manages grafana repo files for $lsbdistrelease
#
class yum::repo::grafana (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require yum::repo::base

  File {
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
  }

  file { '/etc/yum.repos.d/grafana.repo':
    content => template("yum/${::operatingsystem}/grafana.erb"),
  }
}
