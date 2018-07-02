# Class: yum::repo::pulp
#
# This module manages Pulp repo files for $lsbdistrelease
#
class yum::repo::pulp (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/pulp.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/pulp.repo",
  }
}
