#
# = Class: yum::repo::mongodb
#
# This module manages MongoDB repo files for $lsbdistrelease
#
class yum::repo::mongodb (
  $priority  = '1',
  $version   = '5.0',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
){
  require ::yum::repo::base

  file { "/etc/yum.repos.d/mongodb-org-${version}.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/mongodb-org.erb"),
  }

}
