#
# = Class: yum::repo::ceph
#
# This module manages Ceph repo
#
class yum::repo::ceph (
  $stage     = 'yumsetup',
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $release   = 'nautilus',
){

  require yum::repo::base

  file { '/etc/yum.repos.d/ceph.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content =>  template("yum/${::operatingsystem}/${::operatingsystemrelease}/ceph.erb"),
  }

}
