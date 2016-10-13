# Class: yum::repo::gluster
#
# This module manages Gluster repo files for $lsbdistrelease
#
class yum::repo::gluster(
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/gluster.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/gluster.repo",
  }
}
