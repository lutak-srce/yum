<<<<<<< HEAD
#
# = Class: yum::repo::ceph
#
# This module manages Ceph repo
#
class yum::repo::ceph (
=======
class yum::repo::ceph(
>>>>>>> 96cc029... Add Ceph repo
  $stage     = 'yumsetup',
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $release   = 'nautilus',
){
<<<<<<< HEAD

  require yum::repo::base

  file { '/etc/yum.repos.d/ceph.repo':
=======
  require yum::repo::base

  file { '/etc/yum.repos.d/ceph.repo' :
>>>>>>> 96cc029... Add Ceph repo
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content =>  template("yum/${::operatingsystem}/${::operatingsystemrelease}/ceph.erb"),
  }
<<<<<<< HEAD

=======
>>>>>>> 96cc029... Add Ceph repo
}
