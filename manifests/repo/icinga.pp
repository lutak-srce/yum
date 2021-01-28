#
# = Class: yum::repo::icinga
#
# This module manages icinga repo
#
class yum::repo::icinga (
  $priority = '1',
  $exclude  = [],
  $include  = [],
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/icinga.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/generic/icinga.erb'),
  }
}
