# Class: yum::repo::msg-devel
#
# This module manages msg-devel repo files
#
class yum::repo::msgdevel(
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/msg-devel.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/msg-devel.repo",
  }
}
