# Class: yum::repo::fhgfs
#
# This module manages FhGFS repo files for $lsbdistrelease
#
class yum::repo::fhgfs (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/fhgfs.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/fhgfs.repo",
  }
}
