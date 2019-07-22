# Class: yum::repo::beegfs7
#
# This module manages BeeGFS repo files for $lsbdistrelease
#
class yum::repo::beegfs7 (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/beegfs7.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/beegfs7.repo",
  }
}
