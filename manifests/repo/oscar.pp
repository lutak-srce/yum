# Class: yum::repo::oscar
#
# This module manages OSCAR repo files for $lsbdistrelease
#
class yum::repo::oscar (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/oscar.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/oscar.repo",
  }
}
