#
# = Class: yum::repo::erlang
#
# This module manages modern erlang repo files for $operatingsystemrelease
#
class yum::repo::erlang (
  $priority = '1',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
){

  require yum::repo::base
  require yum::repo::epel

  file { '/etc/yum.repos.d/erlang.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/erlang.erb"),
  }

}
