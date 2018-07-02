#
# = Class: yum::repo::clickhouse
#
# This module manages clickhouse repo files for $lsbdistrelease
#
class yum::repo::clickhouse(
  $priority  = '1',
  $exclude   = [],
  $include   = [],
){
  file { '/etc/yum.repos.d/clickhouse.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/clickhouse.erb"),
  }
}
