# Class: yum::repo::ownCloud
#
# This module manages ownCloud repo files for $lsbdistrelease
#
class yum::repo::ownCloud(
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/ownCloud.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/ownCloud.repo",
  }
}
