#
# = Class: yum::repo::hashicorp
#
# This module manages Hashicorp repo files for $lsbdistrelease
#
class yum::repo::hashicorp (
  $priority  = '61',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $test      = false,
){
  require yum::repo::base

  file {  '/etc/yum.repos.d/hashicorp.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/hashicorp.erb"),
  }

}
