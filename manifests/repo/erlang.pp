#
# = Class: yum::repo::erlang
#
# This module manages erlang repo files for $operatingsystemrelease
#
class yum::repo::erlang (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
){

  require ::yum::repo::base
  require ::yum::repo::epel
  require ::yum::repo::rpmforge


  file { '/etc/yum.repos.d/erlang.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/erlang.erb"),
  }

}
