# Class: yum::repo::tommigdevel
#
# This module manages Tom Mig Devel repo files for $lsbdistrelease
#
class yum::repo::tommigdevel (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/tom-mig-devel.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/tommigdevel.erb"),
  }

}
