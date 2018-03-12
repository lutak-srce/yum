# Class: yum::repo::gluster
#
# This module manages Gluster repo files for $lsbdistrelease
#
class yum::repo::gluster34(
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/glusterfs-epel.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/glusterfs-epel.repo",
  }
}
