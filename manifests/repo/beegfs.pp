# Class: yum::repo::beegfs
#
# This module manages BeeGFS repo files for $lsbdistrelease
#
class yum::repo::beegfs (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/beegfs.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/beegfs.repo",
  }
}
