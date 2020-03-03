# Class: yum::repo::pulp
#
# This module manages Pulp repo files for $lsbdistrelease
#
class yum::repo::pulp (
  $priority  = '10',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/pulp.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/pulp.erb"),
  }
}
