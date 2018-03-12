# Class: yum::repo::adesso
#
# This module manages Filesender repo files for $lsbdistrelease
#
class yum::repo::trevor(
  $exclude  = [],
){
  require yum::repo::base

  file { '/etc/yum.repos.d/home:TrevorBl.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/home:TrevorBl.repo",
  }
}
