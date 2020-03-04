# Class: yum::repo::filesender
#
# This module manages Filesender repo files for $lsbdistrelease
#
class yum::repo::filesender(
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/filesender-stable.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/filesender-stable.repo",
  }
}
