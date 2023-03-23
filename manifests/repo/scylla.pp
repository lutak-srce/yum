#
# = Class: yum::repo::scylla
#
# This module manages Scylla repo files for $lsbdistrelease
#
class yum::repo::scylla (
  $priority   = '1',
  $exclude    = [],
  $include    = [],
  $enterprise = false,
  $version    = '3.1',
  $baseurl    = undef,
){

  file { '/etc/yum.repos.d/scylla.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/scylla.erb"),
  }

}
