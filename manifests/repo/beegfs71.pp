# Class: yum::repo::beegfs71
#
# This module manages BeeGFS 7.1 repo files for $lsbdistrelease
#
class yum::repo::beegfs71 (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/beegfs71.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/beegfs71.repo",
  }
}
