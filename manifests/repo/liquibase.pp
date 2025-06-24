#
# = Class: yum::repo::liquibase
#
# This module manages Liquibase repo files
#
class yum::repo::liquibase (
  $priority = '1',
  $exclude  = [],
  $include  = [],
){
  require yum::repo::base

  file { '/etc/yum.repos.d/liquibase.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/generic/liquibase.erb'),
  }
}
