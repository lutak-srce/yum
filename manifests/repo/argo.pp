#
# = Class: yum::repo::argo
#
# This module manages ARGO repo files for $lsbdistrelease
#
class yum::repo::argo (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $type      = 'prod',
){

  require ::yum::repo::base

  file { '/etc/yum.repos.d/argo.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/argo.erb"),
  }

}
