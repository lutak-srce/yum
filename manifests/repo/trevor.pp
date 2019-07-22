# Class: yum::repo::trevor
#
# This module manages Filesender repo files for $lsbdistrelease
#
class yum::repo::trevor(
  $stage   = 'yumsetup',
  $exclude  = [],
){
  require yum::repo::base

  file { '/etc/yum.repos.d/TrevorBl.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/TrevorBl.repo",
  }
}
