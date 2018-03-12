# Class: yum::repo::igtf
#
# This module manages EGI IGTF repo
#
class yum::repo::igtf (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/EGI-trustanchors.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/EGI-trustanchors.repo",
  }
}
