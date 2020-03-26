#
# = Class: yum::repo::percona::experimental
#
# This module manages Percona Experimental repo files for $operatingsystemrelease
#
class yum::repo::percona::experimental (
  $stage    = 'yumsetup',
  $exclude  = [],
  $include  = [],
  $source   = false,
  $priority = '1',
){

  require ::yum::repo::percona

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/percona-release-experimental.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/percona-experimental.erb"),
      }
    }
  }

}
