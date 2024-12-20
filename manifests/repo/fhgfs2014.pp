# Class: yum::repo::fhgfs2014
#
# This module manages FhGFS repo files for $lsbdistrelease
#
class yum::repo::fhgfs2014 (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/fhgfs.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${facts['os']['name']}/${facts['os']['release']['full']}/fhgfs-2014.repo",
  }
}
