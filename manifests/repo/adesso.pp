# Class: yum::repo::adesso
#
# This module manages Filesender repo files for $lsbdistrelease
#
class yum::repo::adesso(
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/home.adesso.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/home.adesso.repo",
  }
}
